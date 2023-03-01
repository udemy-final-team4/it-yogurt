package com.starters.ityogurt.config;

import com.starters.ityogurt.Interceptor.AuthAdminInterceptor;
import com.starters.ityogurt.Interceptor.AuthLoginInterceptor;
import com.starters.ityogurt.Interceptor.MyPageInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthLoginInterceptor())
            .order(1)
            .addPathPatterns("/mypage/**",
            				"/board/form","/board/comment/**",
            				"/admin/user","/admin/user/a",
            				"/admin/user/manage/**","/admin/user/manage/**/**",
            				"/admin/contents",
            				"/admin/user/black", "/admin/user/black/re");
        registry.addInterceptor(new AuthAdminInterceptor())
        	.order(1)
        	.addPathPatterns("/admin/user","/admin/user/a",
            				"/admin/user/manage/**","/admin/user/manage/**/**",
            				"/admin/contents",
            				"/admin/user/black", "/admin/user/black/re");
		registry.addInterceptor(new MyPageInterceptor())
			.order(1)
			.addPathPatterns("/mypage/**");
    }
}