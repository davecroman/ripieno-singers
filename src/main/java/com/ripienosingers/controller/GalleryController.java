package com.ripienosingers.controller;

import com.google.gson.JsonObject;
import com.ripienosingers.model.GalleryImage;
import com.ripienosingers.model.GalleryTab;
import com.ripienosingers.model.NotificationPool;
import com.ripienosingers.service.GalleryService;
import com.ripienosingers.utils.RequestExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class GalleryController {

    @Autowired
    GalleryService galleryService;

    @Autowired
    RequestExecutor requestExecutor;

    @Autowired
    NotificationPool notificationPool;

    @Autowired
    @Qualifier("authorizationKey")
    String basicAuth;

    @RequestMapping(value = "/gallery", method = RequestMethod.GET)
    public String goToGallery(Map<String, Object> map) {
        List<GalleryTab> tabs = requestExecutor.execute(galleryService.getTabs(), notificationPool);

        map.put("tabs", tabs);
        map.put("notificationPool", notificationPool);

        return "gallery";
    }

    @ResponseBody
    @RequestMapping(value = "/gallery/{tab}", method = RequestMethod.GET)
    public ModelAndView getImagesFromTabName(@PathVariable String tab, Model model) {
        List<GalleryImage> images = requestExecutor.execute(galleryService.getImagesFrom(tab));

        model.addAttribute("images", images);
        model.addAttribute("notificationPool", notificationPool);

        return new ModelAndView("galleryTab");
    }

    @RequestMapping(value = "/gallery/addImages", method = RequestMethod.POST, headers = {"Content-type=application/json"})
    public String addImages(@RequestBody GalleryImage[] images, Map<String, Object> map){

        for(GalleryImage image: images){
            JsonObject body = new JsonObject();

            body.addProperty("url", image.getUrl());
            body.addProperty("caption", image.getCaption());
            body.addProperty("tab", image.getTab());

            requestExecutor.execute(galleryService.addImage(basicAuth, body));
        }

        return "gallery";
    }

    @RequestMapping(value = "/gallery/remove/{imageId}", method = RequestMethod.POST)
    public String removeImage(@PathVariable String imageId, Map<String, Object> map){
        requestExecutor.execute(galleryService.removeImage(basicAuth, imageId));

        return "gallery";
    }
}
