<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
    <head>
        <meta charset="utf-8">
        <!-- <title>elFinder 2.1.x source version with PHP connector</title> -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2" />
     <link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

   <!--  Necessary to have elfinder js in iFrame -->
   <script src="[[+npAssetsURL]]elfinder/js/elfinder.min.js"
                type="text/javascript"></script>

        <script type="text/javascript">

            var FileBrowserDialogue = {
                init: function () {
                    // Here goes your code for setting your custom things onLoad.
                },
                mySubmit: function (URL) {
                    // pass selected file path to TinyMCE
                    parent.tinymce.activeEditor.windowManager.getParams().setUrl(URL);

                    // force the TinyMCE dialog to refresh and fill in the image dimensions
                    var t = parent.tinymce.activeEditor.windowManager.windows[0];
                    t.find('#src').fire('change');

                    // close popup window
                    parent.tinymce.activeEditor.windowManager.close();
                }
            };

            $().ready(function () {
                var elf = $('#elfinder').elfinder({
                    // set your elFinder options here
                    'allowShortcuts' : false,
                   /* commandsOptions:  {
                      upload : {
                          shortcuts : [] // for disable this command's shortcuts
                      },
                    },
                   */
                    loadtmbs: 50,
                    url: '[[++site_url]]npelfinderconnector[[+np_html_extension]][[+media_source]]',
                    rememberLastDir : [[++np_elfinder_remember_last_dir]],
                    cssAutoLoad: [
                        '[[+npAssetsURL]]elfinder/elfinderthemes/[[++np_elfinder_theme]]/css/theme.css'
                    ],

                    width : window.innerWidth-20,
                    height : window.innerHeight-20,
                    getFileCallback: function (file) { // editor callback
                        // file.url - commandsOptions.getfile.onlyURL = false (default)
                        // file     - commandsOptions.getfile.onlyURL = true
                        FileBrowserDialogue.mySubmit(file.url); // pass selected file path to TinyMCE
                    }
                }).elfinder('instance');
                // console.log('Content media source: ' + '[[+media_source]]');
            });

            /* Added */
            jQuery.browser = {};
            (function () {
                jQuery.browser.msie = false;
                jQuery.browser.version = 0;
                if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                    jQuery.browser.msie = true;
                    jQuery.browser.version = RegExp.$1;
                }
            })();


        </script>

    </head>
    <body>

        <!-- Element where elFinder will be created (REQUIRED) -->
        <div id="elfinder"></div>

    </body>
</html>
