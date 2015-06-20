package com.ripienosingers.controller;

import org.junit.Before;

import java.util.Map;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.mock;

public class LandingPageControllerTest {

    private LandingPageController landingPageController;

    @Before
    public void setUp() {
        this.landingPageController = new LandingPageController();
    }

    @org.junit.Test
    public void testGoHome() {
        String view = landingPageController.goToLandingPage(mock(Map.class));

        assertThat(view, is("textcounter"));
    }
}
