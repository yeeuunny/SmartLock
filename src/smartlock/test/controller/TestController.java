package smartlock.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import smartlock.test.service.TestService;

import javax.annotation.Resource;

@Controller
public class TestController {

    @Resource(name="testService")
    private TestService testService;

    @RequestMapping("/test")
    public ModelAndView test() throws Exception{
        ModelAndView mav = testService.test();
        return mav;
    }
}