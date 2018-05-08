package smartlock.download.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smartlock.download.service.FileSystemStorageService;
import smartlock.download.service.StorageService;

@Controller
public class DownloadWebController {

	@RequestMapping(value = "/download", method = RequestMethod.GET)
    public ModelAndView download(HttpServletRequest request)
    {
		return new ModelAndView("/smartlock/download");
    }

    @RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@RequestParam("path") String path,
    	    @RequestParam("fileName") String fileName, HttpServletRequest request)
   {
        StorageService storageService = new FileSystemStorageService(request);
        Resource file = storageService.loadAsResource(fileName);
        
        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" + file.getFilename() + "\"").body(file);
    }

//    @ExceptionHandler(StorageFileNotFoundException.class)
//    public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException exc) {
//        return ResponseEntity.notFound().build();
//    }

}
