'use strict';

module.exports = function() {
    if (typeof document !== "undefined") { return; }
    var jsdom = require("jsdom").jsdom;
    var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
    global.document = jsdom("<html><body></body></html>");
    global.window = document.defaultView;
    global.navigator = window.navigator;
    global.location = window.location;
    global.XMLHttpRequest = XMLHttpRequest;
};