import ReactRailsUJS from "react_ujs";

const unmountTopLevelComponents = () => {
    const { mountedComponents } = ReactRailsUJS;
    mountedComponents.forEach((component) => {
        if (!component.is_mounted()) return;
        if (!component.node.parentElement) ReactRailsUJS.unmountComponents(comopnent);
    });
};

document.addEventListener('turbo:load', () => {
    ReactRailsUJS.mountComponents();
});

document.addEventListener('turbo:before-cache', () => {
    unmountTopLevelComponents();
});
