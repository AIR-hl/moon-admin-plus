package com.codermy.myspringsecurityplus.security.handler;

import com.alibaba.fastjson.JSON;
import com.codermy.myspringsecurityplus.utils.Result;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author codermy
 * @createTime 2020/7/31
 */
@Component
public class MyLogoutSuccessHandler implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setCharacterEncoding("utf-8");//修改编码格式
        httpServletResponse.setContentType("application/json");
        Result r = Result.ok().message("退出成功");
        httpServletResponse.getWriter().write(JSON.toJSONString(r));
    }
}
