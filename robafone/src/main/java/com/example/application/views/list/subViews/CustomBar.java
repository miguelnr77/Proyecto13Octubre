package com.example.application.views.list.subViews;

import com.vaadin.flow.component.Unit;
import com.vaadin.flow.component.dependency.CssImport;
import com.vaadin.flow.component.html.Anchor;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;

@CssImport("./styles/myStyle.css")
public class CustomBar extends HorizontalLayout {

    VerticalLayout menuDiv1, menuDiv2, menuDiv3, menuDiv4;
    Anchor link1, link2, link3, link4;

    public CustomBar() {
        setWidthFull();
        setHeight("60px");
        getStyle().set("background-color", "rgb(255, 192, 203)"); // Cambiado el color de fondo
        getStyle().set("border", "2px solid #e74c3c"); // Cambiado el color del borde
        getStyle().set("box-shadow", "4px 4px 8px rgba(0, 0, 0, 0.3)"); // Cambiado el sombreado
        setPadding(false);
        setSpacing(true);

        menuDiv1 = new VerticalLayout();
        menuDiv1.addClassName("alternative-vlNavBar");
        link1 = new Anchor("#", "SERVICIOS");
        link1.addClassName("alternative-anchor1");
        menuDiv1.add(link1);
        add(menuDiv1);

        menuDiv2 = new VerticalLayout();
        menuDiv2.addClassName("alternative-vlNavBar");
        link2 = new Anchor("#", "PROMOCIONES");
        link2.addClassName("alternative-anchor1");
        menuDiv2.add(link2);
        add(menuDiv2);

        menuDiv3 = new VerticalLayout();
        menuDiv3.addClassName("alternative-vlNavBar");
        link3 = new Anchor("#", "CONTACTO");
        link3.addClassName("alternative-anchor1");
        menuDiv3.add(link3);
        add(menuDiv3);

        menuDiv4 = new VerticalLayout();
        menuDiv4.addClassName("alternative-vlNavBar");
        link4 = new Anchor("#", "QUIÉNES SOMOS");
        link4.addClassName("alternative-anchor1");
        menuDiv4.add(link4);
        add(menuDiv4);
    }
}

