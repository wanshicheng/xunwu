package com.skillip.xunwu.security;

import com.skillip.xunwu.entity.User;
import com.skillip.xunwu.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Slf4j
public class AuthProvider implements AuthenticationProvider {
    @Autowired
    private UserService userService;
    private final PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();


    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String userName = authentication.getName();
        String inputPassword = (String) authentication.getCredentials();

        User user = userService.findUserByName(userName);
        if(user == null) {
            throw new AuthenticationCredentialsNotFoundException("authError");
        }
        log.warn(inputPassword);
        log.warn(user.getPassword());
        if(passwordEncoder.matches(inputPassword, user.getPassword()))
            return new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());;

        throw new BadCredentialsException("authError");
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
