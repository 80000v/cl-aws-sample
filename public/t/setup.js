'use strict';

import {jsdom} from 'jsdom';
import {XMLHttpRequest} from 'xmlhttprequest';

// TODO【検証】 使う側でimport即時実行ができないなら、こちら側で即時関数をexportしたらうまくいくだろうか？
export default function() {
    if (typeof document !== "undefined") { return; }
    //var jsdom = require("jsdom").jsdom;
    //var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
    global.document = jsdom("<html><body></body></html>");
    global.window = document.defaultView;
    global.navigator = window.navigator;
    global.location = window.location;
    global.XMLHttpRequest = XMLHttpRequest;
};