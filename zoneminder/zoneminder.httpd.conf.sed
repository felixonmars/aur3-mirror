/^LoadModule php5_module modules\/libphp5.so/d;
/^LoadModule rewrite_module modules\/mod_rewrite.so/ s/$/\nLoadModule php5_module modules\/libphp5.so/;
/^# PHP 5/d;
/^# ZoneMinder/d;
/^Include \/etc\/httpd\/conf\/extra\/php5_module.conf/d;
/^Include \/etc\/httpd\/conf\/extra\/httpd-zoneminder.conf/d;
/^Include conf\/extra\/httpd-default.conf/ s/$/\n\n# PHP 5\n\Include \/etc\/httpd\/conf\/extra\/php5_module.conf\n\n# ZoneMinder\nInclude \/etc\/httpd\/conf\/extra\/httpd-zoneminder.conf/;
