package com.fit.nlu.DHHCeramic.filter;


import com.fit.nlu.DHHCeramic.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = "/member/*")
public class MemberSecurity implements Filter {

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resq = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("account");
        User user = (User) obj;
        if (obj != null) {
            chain.doFilter(request, response);
            return; //
        } else {
            resq.sendRedirect(req.getContextPath() + "/login");
        }

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub

    }

}

