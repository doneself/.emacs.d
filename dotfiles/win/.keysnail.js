// ========================== KeySnail Init File =========================== //

// You can preserve your code in this area when generating the init file using GUI.
// Put all your code except special key, set*key, hook, blacklist.
// ========================================================================= //
//{{%PRESERVE%
// Put your codes here
//}}%PRESERVE%
// ========================================================================= //

// ========================= Special key settings ========================== //

key.quitKey              = "C-g";
key.helpKey              = "<f1>";
key.escapeKey            = "M-q";
key.macroStartKey        = "<f3>";
key.macroEndKey          = "<f4>";
key.universalArgumentKey = "C-u";
key.negativeArgument1Key = "C--";
key.negativeArgument2Key = "C-M--";
key.negativeArgument3Key = "M--";
key.suspendKey           = "<f2>";

// ================================= Hooks ================================= //

hook.setHook('KeyBoardQuit', function (aEvent) {
    if (key.currentKeySequence.length) return;

    command.closeFindBar();

    let marked = command.marked(aEvent);

    if (util.isCaretEnabled()) {
        if (marked) {
            command.resetMark(aEvent);
        } else {
            if ("blur" in aEvent.target) aEvent.target.blur();

            gBrowser.focus();
            _content.focus();
        }
    } else {
        goDoCommand("cmd_selectNone");
    }

    if (KeySnail.windowType === "navigator:browser" && !marked) {
        key.generateKey(aEvent.originalTarget, KeyEvent.DOM_VK_ESCAPE, true);
    }
});


// ============================= Key bindings ============================== //

key.setGlobalKey(['C-x', 'C-e'], function (ev) {
    userscript.reload();
}, 'Reload the initialization file', true);

key.setGlobalKey('M-x', function (ev, arg) {
    ext.select(arg, ev);
}, 'List exts and execute selected one', true);

key.setGlobalKey(['C-c', '='], function (ev) {
    command.interpreter();
}, 'Command interpreter', true);

key.setGlobalKey(['<f1>', 'c'], function (ev) {
    key.listKeyBindings();
}, 'List all keybindings');

key.setGlobalKey(['<f1>', 'F'], function (ev) {
    openHelpLink("firefox-help");
}, 'Display Firefox help');

key.setGlobalKey('C-m', function (ev) {
    key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_RETURN, true);
}, 'Generate the return key code');

key.setGlobalKey('M-,', function (ev) {
    window.loadURI(ev.target.ownerDocument.location.href);
}, 'Show current frame only', true);

key.setGlobalKey(['C-x', 'l'], function (ev) {
    command.focusToById("urlbar");
}, 'Focus to the location bar', true);

key.setGlobalKey(['C-x', 'g'], function (ev) {
    command.focusToById("searchbar");
}, 'Focus to the search bar', true);

key.setGlobalKey(['C-x', 't'], function (ev) {
    command.focusElement(command.elementsRetrieverTextarea, 0);
}, 'Focus to the first textarea', true);

key.setGlobalKey(['C-x', 's'], function (ev) {
    command.focusElement(command.elementsRetrieverButton, 0);
}, 'Focus to the first button', true);

key.setGlobalKey(['C-x', 'K'], function (ev) {
    closeWindow(true);
}, 'Close the window');

key.setGlobalKey(['C-x', 'n'], function (ev) {
    OpenBrowserWindow();
}, 'Open new window');

key.setGlobalKey(['C-x', 'C-c'], function (ev) {
    goQuitApplication();
}, 'Exit Firefox', true);

key.setGlobalKey(['C-x', 'C-f'], function (ev) {
    BrowserOpenFileWindow();
}, 'Open the local file', true);

key.setGlobalKey(['C-x', 'C-s'], function (ev) {
    saveDocument(window.content.document);
}, 'Save current page to the file', true);

key.setGlobalKey('C-q', function (ev) {
    BrowserCloseTabOrWindow();
}, 'Close tab / window');

key.setGlobalKey(['C-x', 'o'], function (ev, arg) {
    command.focusOtherFrame(arg);
}, 'Select next frame');

key.setGlobalKey('M-w', function (ev) {
    command.copyRegion(ev);
}, 'Copy selected text', true);

key.setGlobalKey('C-s', function (ev) {
    command.iSearchForwardKs(ev);
}, 'Emacs like incremental search forward', true);

key.setGlobalKey('C-r', function (ev) {
    command.iSearchBackwardKs(ev);
}, 'Emacs like incremental search backward', true);

key.setGlobalKey(['C-x', 'C-,'], function (ev) {
    undoCloseTab();
}, 'Undo closed tab');

key.setGlobalKey(['C-c', 'C-x', 'C-v'], function (ev) {
    toJavaScriptConsole();
}, 'Display JavaScript console', true);

key.setGlobalKey(['C-c', 'C-x', 'C-c'], function (ev) {
    command.clearConsole();
}, 'Clear Javascript console', true);

key.setGlobalKey(['C-x', 'C-l'], function (ev) {
    getBrowser().mTabContainer.advanceSelectedTab(1, true);
}, 'Select next tab');

key.setGlobalKey(['C-x','C-h'], function (ev) {
    getBrowser().mTabContainer.advanceSelectedTab(-1, true);
}, 'Select previous tab');

key.setViewKey([['C-n'], ['j']], function (ev) {
    key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_DOWN, true);
}, 'Scroll line down');

key.setViewKey([['C-p'], ['k']], function (ev) {
    key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_UP, true);
}, 'Scroll line up');

key.setViewKey('C-f', function (ev) {
    key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_RIGHT, true);
}, 'Scroll right');

key.setViewKey('C-b', function (ev) {
    key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_LEFT, true);
}, 'Scroll left');

key.setViewKey('M-v', function (ev) {
    goDoCommand("cmd_scrollPageUp");
}, 'Scroll page up');

key.setViewKey('C-v', function (ev) {
    goDoCommand("cmd_scrollPageDown");
}, 'Scroll page down');

key.setViewKey('M-<', function (ev) {
    goDoCommand("cmd_scrollTop");
}, 'Scroll to the top of the page', true);

key.setViewKey('M->', function (ev) {
    goDoCommand("cmd_scrollBottom");
}, 'Scroll to the bottom of the page', true);

key.setViewKey('l', function (ev) {
    getBrowser().mTabContainer.advanceSelectedTab(1, true);
}, 'Select next tab');

key.setViewKey('h', function (ev) {
    getBrowser().mTabContainer.advanceSelectedTab(-1, true);
}, 'Select previous tab');

key.setViewKey(':', function (ev, arg) {
    shell.input(null, arg);
}, 'List and execute commands', true);

key.setViewKey('R', function (ev) {
    BrowserReload();
}, 'Reload the page', true);

key.setViewKey('B', function (ev) {
    BrowserBack();
}, 'Back');

key.setViewKey('F', function (ev) {
    BrowserForward();
}, 'Forward');

key.setViewKey(['C-x', 'h'], function (ev) {
    goDoCommand("cmd_selectAll");
}, 'Select all', true);

key.setViewKey('M-m', function (ev) {
    command.focusElement(command.elementsRetrieverTextarea, 0);
}, 'Focus to the first textarea', true);

key.setViewKey('M-p', function (ev) {
    command.walkInputElement(command.elementsRetrieverButton, true, true);
}, 'Focus to the next button');

key.setViewKey('M-n', function (ev) {
    command.walkInputElement(command.elementsRetrieverButton, false, true);
}, 'Focus to the previous button');

key.setEditKey(['C-x', 'h'], function (ev) {
    command.selectAll(ev);
}, 'Select whole text', true);

key.setEditKey(['C-x', 'r', 'd'], function (ev, arg) {
    command.replaceRectangle(ev.originalTarget, "", false, !arg);
}, 'Delete text in the region-rectangle', true);

key.setEditKey(['C-x', 'r', 't'], function (ev) {
    prompt.read("String rectangle: ", function (aStr, aInput) {
        command.replaceRectangle(aInput, aStr);
    },
                ev.originalTarget);
}, 'Replace text in the region-rectangle with user inputted string', true);

key.setEditKey(['C-x', 'r', 'o'], function (ev) {
    command.openRectangle(ev.originalTarget);
}, 'Blank out the region-rectangle, shifting text right', true);

key.setEditKey(['C-x', 'r', 'k'], function (ev, arg) {
    command.kill.buffer = command.killRectangle(ev.originalTarget, !arg);
}, 'Delete the region-rectangle and save it as the last killed one', true);

key.setEditKey(['C-x', 'r', 'y'], function (ev) {
    command.yankRectangle(ev.originalTarget, command.kill.buffer);
}, 'Yank the last killed rectangle with upper left corner at point', true);

key.setEditKey('C-/', function (ev) {
    display.echoStatusBar("Undo!", 2000);
    goDoCommand("cmd_undo");
}, 'Undo');

key.setEditKey('C-;', function (ev) {
    command.setMark(ev);
}, 'Set the mark', true);

key.setEditKey('M-O', function (ev) {
    command.openLine(ev);
}, 'Open line');

key.setEditKey('C-M-/', function (ev) {
    display.echoStatusBar("Redo!", 2000);
    goDoCommand("cmd_redo");
}, 'Redo');

key.setEditKey('C-a', function (ev) {
    command.beginLine(ev);
}, 'Beginning of the line');

key.setEditKey('C-e', function (ev) {
    command.endLine(ev);
}, 'End of the line');

key.setEditKey('C-f', function (ev) {
    command.nextChar(ev);
}, 'Forward char');

key.setEditKey('C-b', function (ev) {
    command.previousChar(ev);
}, 'Backward char');

key.setEditKey('M-f', function (ev) {
    command.forwardWord(ev);
}, 'Next word');

key.setEditKey('M-b', function (ev) {
    command.backwardWord(ev);
}, 'Previous word');

key.setEditKey('C-n', function (ev) {
    command.nextLine(ev);
}, 'Next line');

key.setEditKey('C-p', function (ev) {
    command.previousLine(ev);
}, 'Previous line');

key.setEditKey('C-v', function (ev) {
    command.pageDown(ev);
}, 'Page down');

key.setEditKey('M-v', function (ev) {
    command.pageUp(ev);
}, 'Page up');

key.setEditKey('M-<', function (ev) {
    command.moveTop(ev);
}, 'Beginning of the text area');

key.setEditKey('M->', function (ev) {
    command.moveBottom(ev);
}, 'End of the text area');

key.setEditKey('C-d', function (ev) {
    goDoCommand("cmd_deleteCharForward");
}, 'Delete forward char');

key.setEditKey('M-d', function (ev) {
    command.deleteForwardWord(ev);
}, 'Delete forward word');

key.setEditKey('C-<backspace>', function (ev) {
    command.deleteBackwardWord(ev);
}, 'Delete backward word');

key.setEditKey('M-U', function (ev, arg) {
    command.wordCommand(ev, arg, command.upcaseForwardWord, command.upcaseBackwardWord);
}, 'Convert following word to upper case');

key.setEditKey('M-L', function (ev, arg) {
    command.wordCommand(ev, arg, command.downcaseForwardWord, command.downcaseBackwardWord);
}, 'Convert following word to lower case');

key.setEditKey('M-C', function (ev, arg) {
    command.wordCommand(ev, arg, command.capitalizeForwardWord, command.capitalizeBackwardWord);
}, 'Capitalize the following word');

key.setEditKey('C-k', function (ev) {
    command.killLine(ev);
}, 'Kill the rest of the line');

key.setEditKey('C-y', command.yank, 'Paste (Yank)');

key.setEditKey('M-y', command.yankPop, 'Paste pop (Yank pop)', true);

key.setEditKey('C-M-y', function (ev) {
    if (!command.kill.ring.length)
        return;

    let (ct = command.getClipboardText())
    (!command.kill.ring.length || ct != command.kill.ring[0]) && command.pushKillRing(ct);

    prompt.selector(
        {
            message: "Paste:",
            collection: command.kill.ring,
            callback: function (i) { if (i >= 0) key.insertText(command.kill.ring[i]); }
        }
    );
}, 'Show kill-ring and select text to paste', true);

key.setEditKey('C-w', function (ev) {
    goDoCommand("cmd_copy");
    goDoCommand("cmd_delete");
    command.resetMark(ev);
}, 'Cut current region', true);

key.setEditKey('M-n', function (ev) {
    command.walkInputElement(command.elementsRetrieverTextarea, true, true);
}, 'Focus to the next text area');

key.setEditKey('M-p', function (ev) {
    command.walkInputElement(command.elementsRetrieverTextarea, false, true);
}, 'Focus to the previous text area');

key.setCaretKey('C-a', function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectBeginLine") : goDoCommand("cmd_beginLine");
}, 'Move caret to the beginning of the line');

key.setCaretKey('C-e', function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectEndLine") : goDoCommand("cmd_endLine");
}, 'Move caret to the end of the line');

key.setCaretKey([['C-n'], ['j']], function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectLineNext") : goDoCommand("cmd_scrollLineDown");
}, 'Move caret to the next line');

key.setCaretKey([['C-p'], ['k']], function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectLinePrevious") : goDoCommand("cmd_scrollLineUp");
}, 'Move caret to the previous line');

key.setCaretKey([['C-f'], ['l']], function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectCharNext") : goDoCommand("cmd_scrollRight");
}, 'Move caret to the right');

key.setCaretKey([['C-b'], ['h']], function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectCharPrevious") : goDoCommand("cmd_scrollLeft");
}, 'Move caret to the left');

key.setCaretKey('M-f', function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectWordNext") : goDoCommand("cmd_wordNext");
}, 'Move caret to the right by word');

key.setCaretKey('M-b', function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectWordPrevious") : goDoCommand("cmd_wordPrevious");
}, 'Move caret to the left by word');

key.setCaretKey('C-v', function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectPageNext") : goDoCommand("cmd_movePageDown");
}, 'Move caret down by page');

key.setCaretKey('M-v', function (ev) {
    ev.target.ksMarked ? goDoCommand("cmd_selectPagePrevious") : goDoCommand("cmd_movePageUp");
}, 'Move caret up by page');

key.setCaretKey('M-w', function (ev) {
    command.copyRegion(ev);
    children = document.getElementById("nav-bar").children;
    for (i = 0; i < children.length; i++) {
        children[i].style.backgroundColor = "transparent";
    }
    util.setBoolPref("accessibility.browsewithcaret", false);
}, 'Copy selected text and exit caret-browse mode', true);

key.setCaretKey('C-;', function (ev) {
    command.setMark(ev);
}, 'Set the mark', true);

key.setCaretKey(':', function (ev, arg) {
    shell.input(null, arg);
}, 'List and execute commands', true);

key.setCaretKey('R', function (ev) {
    BrowserReload();
}, 'Reload the page', true);

key.setCaretKey('B', function (ev) {
    BrowserBack();
}, 'Back');

key.setCaretKey('F', function (ev) {
    BrowserForward();
}, 'Forward');

key.setCaretKey(['C-x', 'h'], function (ev) {
    goDoCommand("cmd_selectAll");
}, 'Select all', true);

key.setCaretKey('M-m', function (ev) {
    command.focusElement(command.elementsRetrieverTextarea, 0);
}, 'Focus to the first textarea', true);

key.setCaretKey('M-p', function (ev) {
    command.walkInputElement(command.elementsRetrieverButton, true, true);
}, 'Focus to the next button');

key.setCaretKey('M-n', function (ev) {
    command.walkInputElement(command.elementsRetrieverButton, false, true);
}, 'Focus to the previous button');

// 上一页下一页
ext.add("previous-page", function () {
    var document = window._content.document;
    var links = document.links;
    for(i = 0; i < links.length; i++) {
        if (   (links[i].text == '上一页')   || (links[i].text == '<上一页')
               || (links[i].text == 'Previous') || (links[i].text == 'Prev')
               || (links[i].text == '<')        || (links[i].text == '<<'))
            document.location = links[i].href;
    }
}, "Previous page");

ext.add("next-page", function () {
    var document = window._content.document;
    var links = document.links;
    for(i = 0; i < links.length; i++) {
        if (   (links[i].text == '下一页')  || (links[i].text == '下一页>')
               || (links[i].text == 'Next')    || (links[i].text == 'next')
               || (links[i].text == '>')       || (links[i].text == '>>'))
            document.location = links[i].href;
    }
}, "Next page");

key.setViewKey(['<'], function(ev, arg) {
    ext.exec("previous-page", arg, ev);
}, "Previous page");

key.setViewKey(['>'], function(ev, arg) {
    ext.exec("next-page", arg, ev);
}, "Next page");

// caret模式，下面这句会导致自动进入caret模式
// util.setBoolPref("accessibility.browsewithcaret", true);
//this add some visual effect indicating the caret mode
key.setViewKey(['C-c', 'C-c'], function (ev) {
    children = document.getElementById("nav-bar").children;
    for (i = 0; i < children.length; i++) {
        children[i].style.backgroundColor = "pink";
    }
    util.setBoolPref("accessibility.browsewithcaret", true);
}, 'Start Caret-Browse Mode');

key.setCaretKey(['C-c', 'C-c'], function (ev) {
    children = document.getElementById("nav-bar").children;
    for (i = 0; i < children.length; i++) {
        children[i].style.backgroundColor = "transparent";
    }
    util.setBoolPref("accessibility.browsewithcaret", false);
}, 'Exit Caret-Browse Mode');

// paste and go
ext.add("paste-and-go", function() {
    var url = command.getClipboardText();
    if (url.indexOf("://") !=-1) {
        window._content.location = url;
    } else {
        BrowserSearch.loadSearch(url, false);
    }
}, "Paste the URL or keyword from clipboard and Go");

key.setViewKey(['C-c', 'p'], function(ev, arg) {
    ext.exec("paste-and-go");
}, "Paste and Go", true);

ext.add("paste-to-tab-and-go", function() {
    var url = command.getClipboardText();
    if (url.indexOf("://") != -1)
        gBrowser.loadOneTab(url, null, null, null, false);
    else
    {
        //url = util.format("http://www.google.com/search?q=%s&ie=utf-8&oe=utf-8", encodeURIComponent(url));
        BrowserSearch.loadSearch(url, true);
    }
}, "Paste the URL or keyword from clipboard to a new tab and Go");

key.setViewKey(['C-c', 'P'], function(ev, arg) {
    ext.exec("paste-to-tab-and-go");
}, "Paste to tab and Go", true);

// open and tabopen
key.setGlobalKey(['C-c', 'o'], function (ev, arg) {
    shell.input("open http://");
}, 'Open URL (with search engine)');

key.setGlobalKey(['C-c', 't'], function (ev, arg) {
    shell.input("tabopen http://");
}, 'Open URL (with search engine) in new tab');

key.setGlobalKey(['C-c', 'O'], function (ev, arg) {
    var url = window._content.document.location;
    shell.input("open " + url);
}, 'Edit current url and open it');

// 书签
key.setGlobalKey(['C-\''], function (ev, arg) {
    ext.exec("bmany-list-all-bookmarks", arg, ev);
}, 'bmany - List all bookmarks');

key.setGlobalKey(['C-x', 'C-\''], function (ev, arg) {
    ext.exec("bmany-list-toolbar-bookmarks", arg, ev);
}, 'bmany - List all bookmarklets');

key.setGlobalKey(['C-c', 'C-\''], function (ev, arg) {
    ext.exec("bmany-list-bookmarks-with-keyword", arg, ev);
}, 'bmany - List bookmarks with keyword');

// tanything
key.setGlobalKey('C-,', function (ev, arg) {
    ext.exec('tanything', arg, ev);
}, 'view all tabs ', true);

// hok
key.setGlobalKey(['C-h'], function (ev, arg) {
    ext.exec('hok-start-foreground-mode', arg, ev);
}, 'Start Hit a Hint foreground mode', true);

key.setGlobalKey(['C-c', 'C-h'], function (ev, arg) {
    ext.exec('hok-start-background-mode', arg, ev);
}, 'Start Hit a Hint background mode', true);

key.setGlobalKey('C-M-h', function (ev, arg) {
    children = document.getElementById("nav-bar").children;
    for (i = 0; i < children.length; i++) {
        children[i].style.backgroundColor = "pink";
    }
    util.setBoolPref("accessibility.browsewithcaret", false);
    ext.exec("hok-start-extended-mode", arg);
}, 'Start Hit a Hint Extented mode', true);

key.setGlobalKey(['C-o', 'b'], function (ev, arg) {
    var myUrl = "http://cn.bing.com";
    var ff= document.getElementById("content");
    var tab = ff.addTab(myUrl);
    ff.selectedTab = tab;
}, 'Open Bing', true);

key.setGlobalKey(['C-o', 'g'], function (ev, arg) {
    var myUrl = "http://www.google.com";
    var ff= document.getElementById("content");
    var tab = ff.addTab(myUrl);
    ff.selectedTab = tab;
}, 'Open Google', true);
