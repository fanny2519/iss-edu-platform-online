package com.iss.edu.controller;

import com.iss.edu.common.Pagination;
import com.iss.edu.common.ResultModel;
import com.iss.edu.dao.StudentDao;
import com.iss.edu.model.Class;
import com.iss.edu.model.Student;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.*;

@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentDao studentDao;

    @GetMapping("/getPage")
    public Pagination<Student> getPage(Pagination page) {
        int start = (page.getPageNum() - 1) * page.getPageSize();
        List<Student> rows = this.studentDao.getPage(start, page.getPageSize(), page.getQueryValue());
        int total = this.studentDao.getCount(page.getQueryValue());
        page.setRows(rows);
        page.setTotal(total);
        return page;
    }

    @GetMapping("/getStudent/{id}")
    public Student getStudent(@PathVariable("id") int id) {
        return this.studentDao.getStudent(id);
    }

    @PostMapping("/insertStudent")
    public ResultModel insertStudent(@RequestBody Student student) {
        int result = this.studentDao.insertStudent(student);
        if (result > 0 && student.getClasses() != null && student.getClasses().size() > 0) {
            result = this.studentDao.insertStudentClass(student.getId(), student.getClasses());
            if (result < 1) return ResultModel.error();
        }
        return ResultModel.isSuccess(result > 0);
    }

    @PostMapping("/updateStudent")
    public ResultModel updateStudent(@RequestBody Student student) {
        int result = this.studentDao.updateStudent(student);
        if (result > 0 && student.getClasses() != null && student.getClasses().size() > 0) {
            return this.updateStudentClasses(student.getId(), student.getClasses());
        }
        return ResultModel.isSuccess(result > 0);
    }

    @GetMapping("/delete/{id}")
    public ResultModel delete(@PathVariable("id") int id) {
        return ResultModel.isSuccess(this.studentDao.delete(id) > 0);
    }

    @GetMapping("/deletes")
    public ResultModel deletes(int[] ids) {
        return ResultModel.isSuccess(this.studentDao.deletes(ids) > 0);
    }

    private ResultModel updateStudentClasses(int studentId, List<Class> classes) {
        int result = this.studentDao.deleteStudentClass(studentId);
        if (result >= 0) {
            result = this.studentDao.insertStudentClass(studentId, classes);
            if (result > 0) return ResultModel.isSuccess(result > 0);
        }
        return ResultModel.error();
    }

    @GetMapping("/linkClasses/{studentIds}/{classesIds}")
    public ResultModel linkClasses(@PathVariable("studentIds") Integer[] studentIds, @PathVariable("classesIds") Integer[] classesIds) {
        Set<Integer> ids;
        List<Class> classes;
        for (int id : studentIds) {
            ids = new HashSet<>();
            ids.addAll(Arrays.asList(classesIds));
            ids.addAll(this.studentDao.getClassesById(id));
            classes = new ArrayList<>();
            for (int classesId : ids) {
                classes.add(new Class(classesId));
            }
            this.updateStudentClasses(id, classes);
        }
        return ResultModel.isSuccess(true);
    }

    @PostMapping("/importStudents")
    public ResultModel importStudents(MultipartFile excel) throws IOException {
        String[] template = {"序号", "账号", "姓名", "性别", "手机号", "QQ号码", "邮箱地址"};
        XSSFWorkbook workbook = new XSSFWorkbook(excel.getInputStream());
        XSSFSheet sheet = workbook.getSheetAt(0);
        Row title = sheet.getRow(0);
        for (int i = 0; i < template.length; i++) {
            if (!template[i].equals(title.getCell(i).getStringCellValue())) {
                return ResultModel.error("导入的数据文件与系统提供的数据文件模板不匹配，请重新下载模板编辑数据后导入系统！");
            }
        }
        Student student = null;
        Row row = null;
        List<Student> list = new ArrayList<>();
        for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
            row = sheet.getRow(i);
//            student = new Student(row.getCell(1).getStringCellValue().trim(),
//                    row.getCell(2).getStringCellValue().trim(),
//                    "123456",
//                    row.getCell(3).getStringCellValue().trim(),
//                    row.getCell(4).getStringCellValue().trim(),
//                    row.getCell(5).getStringCellValue().trim(),
//                    row.getCell(6).getStringCellValue().trim()
//            );
            list.add(student);
        }
        return ResultModel.isSuccess(this.studentDao.importStudents(list) > 0);
    }

    @GetMapping(value = "/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request)
            throws Exception {
        InputStream inputStream = new ClassPathResource("templates/students.xlsx").getInputStream();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024 * 4];
        int size = 0;
        while (-1 != (size = inputStream.read(buffer))) {
            output.write(buffer, 0, size);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode("students.xlsx", "UTF-8"));
        return new ResponseEntity<byte[]>(output.toByteArray(), headers, HttpStatus.OK);
    }

}
