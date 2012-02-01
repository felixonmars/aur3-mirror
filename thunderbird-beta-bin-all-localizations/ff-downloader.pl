#!/usr/bin/perl
# ff-downloader v0.5.7
## Copyright 2011-12 Simone Sclavi 'Ito'
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

use strict;
use warnings;
use feature qw(say switch);
use Getopt::Long qw(:config no_ignore_case);
use URI;
use LWP;
use GnuPG qw( :algo );
use Env 'HOME';

my $browser;
sub get_url
{
    my ($url, $file) = @_;
    $browser = LWP::UserAgent->new unless $browser;
    $browser->timeout(30);
    $browser->show_progress(1);
    $browser->env_proxy( );
    my $resp = $browser->get($url, ':content_file' => $file);
    return $resp->is_success;
}


sub read_config
{
    my $p = shift;
    my $conf_file = "${HOME}/.ff-downloader";
    my $lang_code;
    if (! -e $conf_file )
    {
        my $TEXT = << 'HEADER';
# Define here your preferred language(s) for Firefox and Thunderbird.
# ff=en-US
# tb=en-US
HEADER
       open my $fh, '>', $conf_file or do{say ":: Error in $conf_file: $!"; return };
       print $fh $TEXT;
       close $fh;
       return
   }
   else
   {
        open my $fh, '<', $conf_file or do{ say ":: Can't read from $conf_file: $!"; return };
        while( defined( my $line = <$fh>))
            {
                chomp $line; $line =~ s/^\s+//; $line =~ s/\s+$//;
                next if $line =~ /^#/;
                if ($line =~ /^$p=([-a-zA-Z]+)$/)
                {
                    $lang_code = $1;
                }      
            }   
            close $fh;
            return $lang_code;
    }   
}
my ($VER, $PACKAGE, $LANG, $REAL);
my $SUFF = '';
my $pkg = 'ff'; #default value for "--package"
my $res = GetOptions("version|v=s" => \$VER,
                     "real|r"=>\$REAL,
                     "package|p=s" => \$pkg );	

die ":: usage: $0 -p|--package=<package name [ff|tb]> -v|--version=<version number> -r|--real\n" unless $res and (scalar @ARGV == 0);
given ($pkg)
{
    when ('ff')  { $PACKAGE = 'firefox' }
    when ('tb')  { $PACKAGE = 'thunderbird'}
    default { die qq{:: "$pkg" is not a valid value for "--package"! Please use "ff" or "tb"\n}}  
}
die qq{:: "--version" option is mandatory!\n} unless $VER;
$SUFF = '-real' if $REAL;
$LANG = read_config($pkg);

if (!$LANG)
{
    my @ff_i18n = (
	{ language => 'Afrikaans (South Africa)', code => 'af' },
    { language => 'Akan', code => 'ak' },
    { language => 'Aarabic', code => 'ar' },
    { language => 'Assamese', code => 'as' },
    { language => 'Asturian', code => 'ast' },
    { language => 'Belarusian', code => 'be' },
    { language => 'Bulgarian', code => 'bg' },
    { language => 'Bengali (Bangladesh)', code => 'bn-BD' },
    { language => 'Bengali (India)', code => 'bn-IN' },
    { language => 'Breton', code => 'br' },
    { language => 'Bosnian', code => 'bs' },
    { language => 'Catalan', code => 'ca' },
    { language => 'Czech', code => 'cs' },
    { language => 'Kashubian', code => 'csb' },
    { language => 'Welsh', code => 'cy' },
    { language => 'Danish', code => 'da' },
    { language => 'German', code => 'de' },
    { language => 'Greek', code => 'el' },
    { language => 'English (United Kingdom)', code => 'en-GB' },
    { language => 'English (US)', code => 'en-US' },
    { language => 'English (South African)', code => 'en-ZA' },
    { language => 'Esperanto', code => 'eo' },
    { language => 'Spanish (Argentina)', code => 'es-AR' },
    { language => 'Spanish (Chile)', code => 'es-CL' },
    { language => 'Spanish (Spain)', code => 'es-ES' },
    { language => 'Spanish (Mexico)', code => 'es-MX' },
    { language => 'Estonian', code => 'et' },
    { language => 'Basque', code => 'eu' },
    { language => 'Persian', code => 'fa' },
    { language => 'Finnish', code => 'fi' },
    { language => 'French', code => 'fr' },
    { language => 'Frisian', code => 'fy-NL' },
    { language => 'Irish', code => 'ga-IE' },
    { language => 'Gaelic (Scotland)', code => 'gd' },
    { language => 'Galician', code => 'gl' },
    { language => 'Gujarati (India)', code => 'gu-IN' },
    { language => 'Hebrew', code => 'he' },
    { language => 'Hindi', code => 'hi-IN' },
    { language => 'Croatian', code => 'hr' },
    { language => 'Hungarian', code => 'hu' },
    { language => 'Armenian', code => 'hy-AM' },
    { language => 'Indonesian', code => 'id' },
    { language => 'Icelandic', code => 'is' },
    { language => 'Italian', code => 'it' },
    { language => 'Japanese', code => 'ja' },
    { language => 'Kazakh', code => 'kk' },
    { language => 'Kannada', code => 'kn' },
    { language => 'Korean', code => 'ko' },
    { language => 'Kurdish', code => 'ku' },
    { language => 'Ganda', code => 'lg' },
    { language => 'Lithuanian', code => 'lt' },
    { language => 'Latvian', code => 'lv' },
    { language => 'Maithili', code => 'mai' },
    { language => 'Macedonian', code => 'mk' },
    { language => 'Malayalam', code => 'ml' },
#    { language => 'Mongolian', code => 'mn' },
    { language => 'Marathi', code => 'mr' },
    { language => 'Norwegian (Bokmal)', code => 'nb-NO' },
    { language => 'Dutch', code => 'nl' },
    { language => 'Norwegian (Nynorsk)', code => 'nn-NO' },
    { language => 'Northern Sotho', code => 'nso' },
    { language => 'Oriya', code => 'or' },
    { language => 'Punjabi', code => 'pa-IN' },
    { language => 'Polish', code => 'pl' },
    { language => 'Portuguese (Brazil)', code => 'pt-BR' },
    { language => 'Portuguese (Portugal)', code => 'pt-PT' },
    { language => 'Romansh', code => 'rm' },
    { language => 'Romanian', code => 'ro' },
    { language => 'Russian', code => 'ru' },
    { language => 'Sinhalese', code => 'si' },
    { language => 'Slovak', code => 'sk' },
    { language => 'Slovenian', code => 'sl' },
    { language => 'Songhai', code => 'son' },
    { language => 'Albanian', code => 'sq' },
    { language => 'Serbian', code => 'sr' },
    { language => 'Swedish', code => 'sv-SE' },
#    { language => 'Swahili', code => 'sw' },
    { language => 'Tamil', code => 'ta' },
    { language => 'Tamil (Sri Lanka)', code => 'ta-LK' },
    { language => 'Telugu', code => 'te' },
    { language => 'Thai', code => 'th' },
    { language => 'Turkish', code => 'tr' },
    { language => 'Ukrainan', code => 'uk' },
    { language => 'Vietnamese', code => 'vi' },
    { language => 'Chinese (Simplified)', code => 'zh-CN' },
    { language => 'Chinese (Traditional)', code => 'zh-TW' },
    { language => 'Zulu', code => 'zu' },
    );

    my @tb_i18n = (
    { language => 'Aarabic', code => 'ar' },
    { language => 'Asturian', code => 'ast' },
    { language => 'Belarusian', code => 'be' },
    { language => 'Bulgarian', code => 'bg' },
    { language => 'Bengali (Bangladesh)', code => 'bn-BD' },
    { language => 'Breton', code => 'br' },
    { language => 'Catalan', code => 'ca' },
    { language => 'Czech', code => 'cs' },
    { language => 'Danish', code => 'da' },
    { language => 'German', code => 'de' },
    { language => 'Greek', code => 'el' },
    { language => 'English (United Kingdom)', code => 'en-GB' },
    { language => 'English (US)', code => 'en-US' },
    { language => 'Spanish (Argentina)', code => 'es-AR' },
    { language => 'Spanish (Spain)', code => 'es-ES' },
    { language => 'Estonian', code => 'et' },
    { language => 'Basque', code => 'eu' },
    { language => 'Finnish', code => 'fi' },
    { language => 'French', code => 'fr' },
    { language => 'Frisian', code => 'fy-NL' },
    { language => 'Irish', code => 'ga-IE' },
    { language => 'Gaelic (Scotland)', code => 'gd' },
    { language => 'Galician', code => 'gl' },
    { language => 'Hebrew', code => 'he' },
    { language => 'Hungarian', code => 'hu' },
    { language => 'Indonesian', code => 'id' },
    { language => 'Icelandic', code => 'is' },
    { language => 'Italian', code => 'it' },
    { language => 'Japanese', code => 'ja' },
    { language => 'Korean', code => 'ko' },
    { language => 'Lithuanian', code => 'lt' },
    { language => 'Norwegian (Bokmal)', code => 'nb-NO' },
    { language => 'Dutch', code => 'nl' },
    { language => 'Norwegian (Nynorsk)', code => 'nn-NO' },
    { language => 'Punjabi', code => 'pa-IN' },
    { language => 'Polish', code => 'pl' },
    { language => 'Portuguese (Brazil)', code => 'pt-BR' },
    { language => 'Portuguese (Portugal)', code => 'pt-PT' },
    { language => 'Romansh', code => 'rm' },
    { language => 'Romanian', code => 'ro' },
    { language => 'Russian', code => 'ru' },
    { language => 'Sinhalese', code => 'si' },
    { language => 'Slovak', code => 'sk' },
    { language => 'Slovenian', code => 'sl' },
    { language => 'Albanian', code => 'sq' },
    { language => 'Serbian', code => 'sr' },
    { language => 'Swedish', code => 'sv-SE' },
    { language => 'Tamil (Sri Lanka)', code => 'ta-LK' },
    { language => 'Turkish', code => 'tr' },
    { language => 'Ukrainan', code => 'uk' },
    { language => 'Vietnamese', code => 'vi' },
    { language => 'Chinese (Simplified)', code => 'zh-CN' },
    { language => 'Chinese (Traditional)', code => 'zh-TW' },
    );	
    my @u_i18n;
    ( $pkg eq 'ff' ) ? ( @u_i18n = @ff_i18n ) : (@u_i18n = @tb_i18n );
    my @i18n = sort { $a->{language} cmp $b->{language} } @u_i18n;
    my $size = scalar @i18n;

    for (my $i = 0; $i < $size; $i++ )
    {
	    say '[', $i + 1, "] $i18n[$i]{language}";
    }

    print "\n:: please select your language (type corresponding number)\n> ";
    my $choice;
    while (  $choice =  <STDIN> )
    {
	    no warnings;
	    chomp $choice;
	    $choice =~ s/^\s+//;
	    $choice =~ s/\s+$//;
	    last if $choice ~~ [ 1 .. $size ];
	    print ":: WRONG SELECTION!\n:: please select your language (type corresponding number)\n> ";
    }	
    $LANG = $i18n[$choice - 1]{code};
    say ":: \"$i18n[$choice - 1]{language}\" selected\n::";
    say qq{:: HINT: put "$pkg=$LANG" (without quotes) in $HOME/.ff-downloader to avoid being asked about your language each time you build the package\n::};
}
my $ARCH = qx(arch);
chomp $ARCH;

$| = 1; # turn on autoflush;

my $ff_path = "/pub/${PACKAGE}/releases/${VER}${SUFF}/linux-${ARCH}/${LANG}/${PACKAGE}-${VER}.tar.bz2";
my $ff_url = URI->new('ftp://ftp.mozilla.org');
$ff_url->path($ff_path);

##Downloading firefox##
get_url( $ff_url, "${PACKAGE}-${VER}.tar.bz2" ) or die qq(:: ERROR - can't download "${PACKAGE}-${VER}.tar.bz2"\n); 

##downloading signature##
$ff_url->path("${ff_path}.asc");
get_url( $ff_url, "$PACKAGE-${VER}.tar.bz2.asc" ) or die qq(:: ERROR - can't download "${PACKAGE}-${VER}.tar.bz2.asc"\n); 

##downloading public key
$ff_url->path("pub/${PACKAGE}/releases/${VER}${SUFF}/KEY");
get_url( $ff_url, "KEY" ) or die qq(:: ERROR - can't download 'KEY'\n); 

print ':: verifying gnupg signature ... ';
my $gpg = new GnuPG();
$gpg->import_keys( keys => 'KEY');
$gpg->verify ( signature => "${PACKAGE}-${VER}.tar.bz2.asc", file => "${PACKAGE}-${VER}.tar.bz2");
say 'DONE';
