package com.ripienosingers.controller;

import com.google.gson.JsonObject;
import com.ripienosingers.model.Member;
import com.ripienosingers.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import retrofit.Callback;
import retrofit.Response;
import retrofit.Retrofit;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class MembersController {

    @Autowired
    MembersService membersService;

    @Autowired
    @Qualifier("authorizationKey")
    String basicAuth;

    @RequestMapping(value = "/members/reorder", method = RequestMethod.GET)
    public String goToReorderPage(Map<String, Object> map) {
        List<String> notifications = new ArrayList<>();

        if (map.containsKey("notifications")) {
            notifications.addAll((List<String>) map.get("notifications"));
        }

        try {
            Response<List<Member>> response = membersService.getMemberNamesAndPic().execute();
            if( !response.isSuccess()) {
                throw new Exception(response.message());
            }
            List<Member> members = response.body();
            Collections.sort(members);
            map.put("members", members);
        } catch (Exception e) {
            notifications.add("Oops! Something went wrong. Please try again later. Error: " + e.getMessage());
        }

        map.put("notifications", notifications);

        return "membersReorder";
    }

    @RequestMapping(value = "/members/reorder", method = RequestMethod.POST, headers = {"Content-type=application/json"})
    @ResponseBody
    public String reorderMembers(@RequestBody Member[] members, Map<String, Object> map) {
        List<String> notifications = new ArrayList<>();

        try {
            Response<List<Member>> response = membersService.getMemberNamesAndPic().execute();

            for(Member member : members) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("order", member.getOrder());
                membersService.updateMember(basicAuth, Integer.toString(member.getId()), jsonObject).enqueue(new Callback<Member>() {
                    @Override
                    public void onResponse(Response<Member> response, Retrofit retrofit) {

                    }

                    @Override
                    public void onFailure(Throwable t) {

                    }
                });
            }

            notifications.add("Update submitted. Changes may take a while to reflect.");
        } catch (Exception e) {
            notifications.add("Oops! Something went wrong. Please try again later. Error: " + e.getMessage());
        }

        map.put("notifications", notifications);

        return "Successful";
    }

    @RequestMapping(value = "/members", method = RequestMethod.GET)
    public String goToMembersPage(Map<String, Object> map) {

        List<String> notifications = new ArrayList<>();

        if (map.containsKey("notifications")) {
            notifications.addAll((List<String>) map.get("notifications"));
        }

        try {
            Response<List<Member>> response = membersService.getMembers().execute();
            if (!response.isSuccess()) {
                throw new Exception(response.message());
            }
            List<Member> members = response.body();
            Collections.sort(members);
            map.put("members", members);
        } catch (Exception e) {
            notifications.add("Oops! Something went wrong. Service may be down. Please try again later");
            e.printStackTrace();
        }

        map.put("notifications", notifications);

        return "members";
    }

    @RequestMapping(value = "/members/add", method = RequestMethod.POST)
    public String addMember(@RequestParam String name, @RequestParam String title, @RequestParam String description,
                            @RequestParam String facebookLink, @RequestParam String twitterLink, @RequestParam String instagramLink,
                            @RequestParam String profilePicLink, RedirectAttributes redirAttr) {

        List<String> notifications = new ArrayList<>();

        JsonObject body = createMember(name, title, description, facebookLink, twitterLink, instagramLink, profilePicLink);

        try {
            Response<Member> response = membersService.addMember(basicAuth, body).execute();
            if (!response.isSuccess()) {
                throw new Exception(response.message());
            }
            notifications.add("You have succesfully added " + name + " as a member");
        } catch (Exception e) {
            notifications.add("Oops! Something went wrong while adding " + name + " as a member. Error: " + e.getMessage());
            e.printStackTrace();
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/members";
    }

    @RequestMapping(value = "/members/edit/{id}", method = RequestMethod.POST)
    public String updateMember(@PathVariable String id, @RequestParam String name, @RequestParam String title, @RequestParam String description,
                               @RequestParam String facebookLink, @RequestParam String twitterLink, @RequestParam String instagramLink,
                               @RequestParam String profilePicLink, RedirectAttributes redirAttr) {

        List<String> notifications = new ArrayList<>();

        JsonObject body = createMember(name, title, description, facebookLink, twitterLink, instagramLink, profilePicLink);

        try {
            Response<Member> response = membersService.updateMember(basicAuth, id, body).execute();
            if (!response.isSuccess()) {
                throw new Exception(response.message());
            }
            notifications.add("You have succesfully updated " + name + "'s details");
        } catch (Exception e) {
            notifications.add("Oops! Something went wrong while updating " + name + "'s details. Error: " + e.getMessage());
            e.printStackTrace();
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/members";
    }

    @RequestMapping(value = "/members/delete/{id}", method = RequestMethod.POST)
    public String updateMember(@PathVariable String id, RedirectAttributes redirAttr) {

        List<String> notifications = new ArrayList<>();

        try {
            Response<Member> response = membersService.deleteMember(basicAuth, id).execute();
            if (!response.isSuccess()) {
                throw new Exception(response.message());
            }
            notifications.add("Deletion was successful");
        } catch (Exception e) {
            notifications.add("Oops! Something went wrong!. Error: " + e.getMessage());
            e.printStackTrace();
        }

        redirAttr.addFlashAttribute("notifications", notifications);

        return "redirect:/members";
    }

    private JsonObject createMember(@RequestParam String name, @RequestParam String title, @RequestParam String description, @RequestParam String facebookLink, @RequestParam String twitterLink, @RequestParam String instagramLink, @RequestParam String profilePicLink) {
        JsonObject body = new JsonObject();
        body.addProperty("name", name.trim());
        body.addProperty("title", title.trim());
        body.addProperty("description", description);
        body.addProperty("facebook", facebookLink.trim());
        body.addProperty("twitter", twitterLink.trim());
        body.addProperty("instagram", instagramLink.trim());
        body.addProperty("profilepic", profilePicLink.trim());
        return body;
    }
}
