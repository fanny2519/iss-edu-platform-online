package com.iss.edu.common;

import com.iss.edu.config.JwtProperties;
import com.iss.edu.model.Student;
import com.iss.edu.model.User;
import com.iss.edu.model.vo.StudentVO;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtTokenUtil {

    // 注入自己的jwt配置
    @Autowired
    private JwtProperties jwtProperties;

    /**
     * 生成 token
     */
    public String generateToken(User user) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("id", user.getId());
        return Jwts.builder()
                .setClaims(claims)                           // 设置声明信息
                .setSubject(user.getUsername())
                // .setExpiration(generateExpirationDate())    设置过期时间
                .setIssuedAt(new Date())
                .signWith(SignatureAlgorithm.HS512, jwtProperties.getBase64Secret())    // 设置签名
                .compact();
    }

    /**
     * 生成 token
     */
    public String generateToken(StudentVO student) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("id", student.getId());
        return Jwts.builder()
                .setClaims(claims)                           // 设置声明信息
                .setSubject(student.getUsername())
                // .setExpiration(generateExpirationDate())    设置过期时间
                .setIssuedAt(new Date())
                .signWith(SignatureAlgorithm.HS512, jwtProperties.getBase64Secret())    // 设置签名
                .compact();
    }


    public String getUsernameFromToken(String token) {
        String username;
        try {
            Claims claims = Jwts.parser().setSigningKey(jwtProperties.getBase64Secret()).parseClaimsJws(token).getBody();
            username = claims.getSubject();
        } catch (Exception e) {
            username = null;
        }
        return username;
    }

    public Date getCreatedDateFromToken(String token) {
        Claims claims = Jwts.parser().setSigningKey(jwtProperties.getBase64Secret()).parseClaimsJws(token).getBody();
        return new Date((Long) claims.get("iat"));
    }

    public int getUserIdFromToken(String token) {
        Claims claims = Jwts.parser().setSigningKey(jwtProperties.getBase64Secret()).parseClaimsJws(token).getBody();
        return (int) claims.get("id");
    }

    public int getRoleIdFromToken(String token) {
        Claims claims = Jwts.parser().setSigningKey(jwtProperties.getBase64Secret()).parseClaimsJws(token).getBody();
        return (int) claims.get("role");
    }

    public Date getExpirationDateFromToken(String token) {
        Claims claims = Jwts.parser().setSigningKey(jwtProperties.getBase64Secret()).parseClaimsJws(token).getBody();
        return claims.getExpiration();
    }

    //设置过期时间
//    private Date generateExpirationDate() {
//        return new Date(System.currentTimeMillis() + jwtProperties.getTokenValidityInSeconds());
//    }

//    private Boolean isTokenExpired(String token) {
//        final Date expiration = getExpirationDateFromToken(token);
//        return expiration.before(new Date());
//    }

    // 验证当前的token是否有效
//    public Boolean validateToken(String token, User user) {
//        final String username = getUsernameFromToken(token);
//        final Date created = getCreatedDateFromToken(token);
//        return (username.equals(user.getUsername()) && !isTokenExpired(token));
//    }
}