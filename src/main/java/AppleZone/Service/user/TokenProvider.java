package AppleZone.Service.user;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class TokenProvider {

    private final String SECRET_KEY = "your_secret_key_here"; // Replace with a secure key
    private final long EXPIRATION_TIME = 86400000; // 1 day in milliseconds

    public String generateToken(String sdt) {
        return Jwts.builder()
                .setSubject(sdt)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS512, SECRET_KEY)
                .compact();
    }
}