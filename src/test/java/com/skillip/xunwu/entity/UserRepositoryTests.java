package com.skillip.xunwu.entity;

import com.skillip.xunwu.ApplicationTests;
import com.skillip.xunwu.repository.UserRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class UserRepositoryTests extends ApplicationTests {
    @Autowired
    private UserRepository userRepository;

    @Test
    public void testFindOne() {
        Optional<User> user = userRepository.findById(1L);

        Assertions.assertEquals("wali", user.get().getName());
    }
}
