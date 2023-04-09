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

ReactRailsUJS.registerComponent("HelloWorld", HelloWorld);
ReactRailsUJS.registerComponent("ItemsList", ItemsList);
ReactRailsUJS.registerComponent("POItems", POItems);

global.React = React;
global.ReactDOM = ReactDOM;

ReactRailsUJS.useContext(document);
