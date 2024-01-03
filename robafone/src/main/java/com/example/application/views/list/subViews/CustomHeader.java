package com.example.application.views.list.subViews;

import com.vaadin.flow.component.html.Anchor;
import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.FlexComponent;

public class CustomHeader extends HorizontalLayout {

    private final HorizontalLayout leftDiv;
    private final HorizontalLayout centerDiv;
    private final HorizontalLayout rightDiv;

    public CustomHeader() {
        setWidthFull();
        setHeight("100px");
        getStyle().set("background-color", "#4CAF50"); // Color verde para el fondo
        setPadding(true);
        setSpacing(true);
        setAlignItems(FlexComponent.Alignment.CENTER);

        // Sección izquierda
        leftDiv = new HorizontalLayout();
        leftDiv.setAlignItems(FlexComponent.Alignment.CENTER);
        Image logo = new Image("images/custom_logo.png", "Custom Logo");
        logo.setWidth("80px");
        logo.setHeight("80px");
        Anchor leftAnchor = new Anchor("/");
        leftAnchor.add(logo);
        leftDiv.add(leftAnchor);

        // Sección central
        centerDiv = new HorizontalLayout();
        centerDiv.setAlignItems(FlexComponent.Alignment.CENTER);
        H1 title = new H1("Mi Aplicación");
        title.getStyle().set("font-size", "28px");
        title.getStyle().set("color", "white");
        centerDiv.add(title);

        // Sección derecha
        rightDiv = new HorizontalLayout();
        rightDiv.setAlignItems(FlexComponent.Alignment.CENTER);
        Image icon = new Image("images/custom_icon.png", "Custom Icon");
        icon.setWidth("60px");
        icon.setHeight("60px");
        rightDiv.add(icon);

        // Agregar secciones al encabezado
        add(leftDiv, centerDiv, rightDiv);
    }
}

