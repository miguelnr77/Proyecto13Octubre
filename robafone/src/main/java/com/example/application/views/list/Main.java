package com.example.application.views.list;

import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.dependency.CssImport;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.auth.AnonymousAllowed;

@AnonymousAllowed
@CssImport("./styles/myStyle.css") // Cambiado el nombre del archivo CSS
@PageTitle("ROBAphone")
@Route(value = "/main")
public class Main extends VerticalLayout {

    HorizontalLayout CustomHeader, CustomBar, CustomFooter;
    Button loginButton, registerButton;

    public Main() {
        setWidthFull();
        setHeightFull();
        addClassName("MainView");
        setPadding(false);
        setSpacing(false);

        // Header
        CustomHeader = new HorizontalLayout();
        CustomHeader.setWidthFull();
        CustomHeader.setHeight("100px");
        CustomHeader.getStyle().set("background-color", "#3498db"); // Cambiado el color del fondo
        loginButton = new Button("Sign In");
        loginButton.addClickListener(e -> UI.getCurrent().getPage().setLocation("/alternative-menu"));
        loginButton.addClassName("alternativeButton");
        loginButton.getStyle().set("cursor", "pointer");
        CustomHeader.add(loginButton);
        registerButton = new Button("Sign Up");
        registerButton.addClickListener(e -> UI.getCurrent().getPage().setLocation("/alternative-tariffs"));
        registerButton.addClassName("alternativeButton");
        registerButton.getStyle().set("cursor", "pointer");
        CustomHeader.add(registerButton);
        add(CustomHeader);

        // Content
        CustomBar = new HorizontalLayout();
        CustomBar.setWidthFull();
        CustomBar.setHeight("300px");
        CustomBar.getStyle().set("background-color", "rgba(0, 128, 0, 0.2)"); // Cambiado el color del fondo
        add(CustomBar);

        // Footer
        CustomFooter = new HorizontalLayout();
        CustomFooter.setWidthFull();
        CustomFooter.setHeight("50px");
        CustomFooter.getStyle().set("background-color", "#2c3e50"); // Cambiado el color del fondo
        add(CustomFooter);
    }
}

