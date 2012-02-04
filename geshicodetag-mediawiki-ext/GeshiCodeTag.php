<?php
########################
# GeshiCodeTag.php
# Licensed under GPLv3
# by Paul Nolasco
########################

// change directory accordingly
require_once('geshi/geshi.php');
$languagesPath = "extensions/geshicodetag/geshi/geshi";

// 1 - ENABLED, 0 - DISABLED
$codeTag["simple"] = 1;                       // ex. <php> echo </php> 
$codeTag["advanced"]["mode"] = 1;             // ex. <code php n> echo </php>
 
// extra options
/*	
	strict mode - http://qbnz.com/highlighter/geshi-doc.html#using-strict-mode
	ex. <img src="<?php echo rand(1, 100) ?>" /> 
*/
$codeTag["advanced"]["strict"] = 0;			  
 
#############################################

$wgExtensionFunctions[] = "ExtensionCodeTag";
$wgExtensionCredits['parserhook'][] = array( 
        'name' => 'GeSHiCodeTag', 
        'author' => 'Paul Nolasco', 
        'version' => '1.65',
        'description' => 'A tag to create a syntax-highlighted code using GeSHi',
        'url' => 'http://www.mediawiki.org/wiki/Extension:GeSHiCodeTag'
);
$languages = array();
 
function ExtensionCodeTag()
{
        global $wgParser, $codeTag, $languages, $languagesPath;
 
        ReadLanguages();
 
        if($codeTag["advanced"]["mode"])
                $wgParser->setHook('code', 'AdvancedCodeTag');
 
        if($codeTag["simple"])
                foreach($languages as $lang)
                {
                     $wgParser->setHook($lang,
                                   create_function( '$source',
                                        '$geshi = new GeSHi($source,\'' . $lang . '\', \'' . $languagesPath . '\');
                                         return $geshi->parse_code();'
                     ));
                }       
}
 
function ReadLanguages()
{       
        global $languages, $languagesPath;
 
        $dirHandle = opendir($languagesPath) 
                        or die("ERROR: Invalid directory path - [$languagesPath], Modify the value of \$languagesPath'");
 
        $pattern = "^(.*)\.php$";
 
        while ($file = readdir($dirHandle))     
        {       
                if( eregi($pattern, $file) )                            
                        $languages[] = eregi_replace($pattern, "\\1", $file); 
        }
        closedir($dirHandle);
}
 
function AdvancedCodeTag ($source, $settings){          
 
        global $languages, $languagesPath, $codeTag;
        $language = array_shift($settings);      // [arg1]      
 
        // [arg1]
        if($language == '')
          $language='text';                         
 
        if($language == "list")                                                 // list all languages supported
            return "<br>List of supported languages for <b>Geshi " . GESHI_VERSION  . "</b>:<br>"
                   . implode("<br>", $languages);
 
        if($language != "" && !in_array($language, $languages))          // list languages if invalid argument
            return "<br>Invalid language argument, \"<b>" . $language . "</b>\", select one from the list:<br>" 
                   . implode("<br>", $languages);
 
        // set geshi
        $geshi = new GeSHi(trim($source), $language, $languagesPath); 
        $geshi->enable_strict_mode($codeTag["advanced"]["strict"]);        
 
 
        // [arg2 or more]
        if(in_array('n',$settings))                                                  // display line numbers
            $geshi->enable_line_numbers(GESHI_NORMAL_LINE_NUMBERS);
 
	/*
           Add more GeSHi features from [ http://qbnz.com/highlighter/geshi-doc.html  ]
           template:
		  if( in_array( '<PARAMETER NAME>', $settings ) )
		  {
			$geshi-><GESHI FUNCTION CALL>
		  }
        */
                                                                     // removes newlines replaces with <br />
        return str_replace("\n",'<br />', $geshi->parse_code());     
}
