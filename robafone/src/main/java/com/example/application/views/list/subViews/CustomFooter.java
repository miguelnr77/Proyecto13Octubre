package com.example.application.views.list.subViews;

import com.vaadin.flow.component.Unit;
import com.vaadin.flow.component.html.Anchor;
import com.vaadin.flow.component.html.H3;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;

public class CustomFooter extends VerticalLayout {

    HorizontalLayout topDiv, leftTopDiv, rightTopDiv, bottomDiv;
    H3 copyright;
    Anchor link1, link2, link3;
    Image icon1, icon2, icon3;

    public CustomFooter() {
        setWidthFull();
        setHeight("70px");
        getStyle().set("background-color", "#f2f2f2"); // Cambiado el color de fondo
        setPadding(false);
        setSpacing(false);

        topDiv = new HorizontalLayout();
        topDiv.setWidthFull();
        topDiv.setHeight(70, Unit.PERCENTAGE);

        leftTopDiv = new HorizontalLayout();
        leftTopDiv.setWidth(50, Unit.PERCENTAGE);
        leftTopDiv.setHeightFull();
        leftTopDiv.setJustifyContentMode(JustifyContentMode.START);
        leftTopDiv.setAlignItems(Alignment.CENTER);
        leftTopDiv.getStyle().set("visibility", "hidden"); // Haciendo invisible el título
        topDiv.add(leftTopDiv);

        rightTopDiv = new HorizontalLayout();
        rightTopDiv.setWidth(50, Unit.PERCENTAGE);
        rightTopDiv.setHeightFull();
        rightTopDiv.setJustifyContentMode(JustifyContentMode.END);
        rightTopDiv.setAlignItems(Alignment.CENTER);
        rightTopDiv.getStyle().set("visibility", "hidden"); // Haciendo invisibles los iconos y enlaces
        topDiv.add(rightTopDiv);
        add(topDiv);

        bottomDiv = new HorizontalLayout();
        bottomDiv.setWidthFull();
        bottomDiv.setHeight(70, Unit.PERCENTAGE);
        bottomDiv.setJustifyContentMode(JustifyContentMode.CENTER);
        bottomDiv.setAlignItems(Alignment.CENTER);
        bottomDiv.getStyle().set("visibility", "hidden"); // Haciendo invisibles los enlaces y el texto
        add(bottomDiv);

    }

}


