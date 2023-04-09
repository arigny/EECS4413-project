// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import React from "react";
import ReactDOM from "react-dom";
import { createRoot } from "react-dom/client";
import './react-turbo';
import ReactRailsUJS from "react_ujs";
import HelloWorld from "./components/HelloWorld";
import ItemsList from "./components/ItemsList";
import POItems from "./components/POItems";
import "bootstrap";

ReactRailsUJS.registerComponent("HelloWorld", HelloWorld);
ReactRailsUJS.registerComponent("ItemsList", ItemsList);
ReactRailsUJS.registerComponent("POItems", POItems);

global.React = React;
global.ReactDOM = ReactDOM;

ReactRailsUJS.useContext(document);

document.addEventListener("DOMContentLoaded", () => {
    let bootstrapTooltipTriggerElements = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    let bootstrapTooltipInstances = bootstrapTooltipTriggerElements.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    let bootstrapPopoverTriggerElements = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    let bootstrapPopoverInstances = bootstrapPopoverTriggerElements.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });

    let bootstrapDropdownTriggerElements = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
    let bootstrapDropdownInstances = bootstrapDropdownTriggerElements.map(function (dropdownTriggerEl) {
        return new bootstrap.Dropdown(dropdownTriggerEl);
    });
});
