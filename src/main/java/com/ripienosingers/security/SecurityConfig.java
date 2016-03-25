package com.ripienosingers.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import java.util.Map;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static final String USERNAME = "RIPIENO_SINGERS_USERNAME";
    private static final String PASSWORD = "RIPIENO_SINGERS_PASSWORD";

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        Map<String, String> env = System.getenv();

        String username = env.get(USERNAME);
        String password = env.get(PASSWORD);

        auth.inMemoryAuthentication()
                .withUser(username).password(password).roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic()
                .and()
                    .authorizeRequests()
                .antMatchers("/admin/**",
                        "/news/add",
                        "/news/*/confirmDelete",
                        "/news/*/delete",
                        "/news/editor*",
                        "/members/*")
                    .hasRole("ADMIN")
                .and().formLogin()
                    .loginPage("/login")
                    .defaultSuccessUrl("/home")
                    .permitAll()
                .and()
                    .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/login");
    }
}
