package com.ripienosingers.model;

public class Member implements Comparable<Member> {

    private int id;

    private String name;

    private String description;

    private String title;

    private String instagram;

    private String facebook;

    private String twitter;

    private String profilepic;

    private int order;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getTitle() {
        return title;
    }

    public String getInstagram() {
        return instagram;
    }

    public String getFacebook() {
        return facebook;
    }

    public String getTwitter() {
        return twitter;
    }

    public String getProfilePic() {
        return profilepic;
    }

    public int getOrder() {
        return order;
    }

    @Override
    public int compareTo(Member otherMember) {
        return Integer.compare(this.getOrder(), otherMember.getOrder());
    }
}
