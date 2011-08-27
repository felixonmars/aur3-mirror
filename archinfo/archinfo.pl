#!/usr/bin/perl
# From http://bbs.archlinux.org/viewtopic.php?id=24208 # 

use Switch;
use strict;
use File::Basename;

####################
## Config options ##
####################

## What distro logo to use to use, Available "Archlinux Debian Ubuntu None" ##
my $distro = "Archlinux";
my $myArchVersion = "ArchLinux (Core Dump)";

## what values to display. Use "OS Kernel DE WM win_theme Theme Font Icons" ##
my $display = "OS Kernel DE WM Win_theme Theme Icons Font Background";

## Takes a screen shot if set to 0 ##
my $shot = 0;
## Command to run to take screen shot ##
my $command = "scrot -d 10";

## What colors to use for the variables. ##
my $textcolor = "\e[0m";

## Prints little debugging messages if set to 0 ##
my $quite = 1;



########################
## Script starts here ##
########################
## Define some thing to work with strict ##
my @line = ();
my $found = 0;
my $DE = "NONE";
my $WM = "Beryl";

## Hash of WMs and the process they run ##
my %WMlist = ("Beryl", "beryl",
              "Fluxbox", "fluxbox",
              "Openbox", "openbox",
              "Blackbox", "blackbox",
              "Xfwm4", "xfwm4",
              "Metacity", "metacity",
              "Kwin", "kwin",
              "FVWM", "fvwm",
              "Enlightenment", "enlightenment",
              "IceWM", "icewm",
              "Window Maker", "wmaker",
              "PekWM","pekwm" );

## Hash of DEs and the process they run ##     
my %DElist = ("Gnome", "gnome-session",
              "Xfce4", "xfce-mcs-manage",
          "Xfce4.6", "xfconfd",
              "KDE", "ksmserver");

## Get Kernel version ##
if ( $display =~ "Kernel"){
  print "\::$textcolor Finding Kernel version\n" unless $quite == 1;
  my $kernel = `uname -r`;
  $kernel =~ s/\s+/ /g;
  $kernel = " Kernel:$textcolor $kernel";
  push(@line, "$kernel");
}

## Find running processes ##
print "\::$textcolor Getting processes \n" unless $quite == 1;
my $processes = `ps -A | awk {'print \$4'}`;

## Find DE ##
while( (my $DEname, my $DEprocess) = each(%DElist) ) {
  print "\::$textcolor Testing $DEname process: $DEprocess \n" unless $quite == 1;
  if ( $processes =~ m/$DEprocess/ ) {
    $DE = $DEname;
    print "\::$textcolor DE found as $DE\n" unless $quite == 1;
    if( $display =~ m/DE/ ) {
      push(@line, " DE:$textcolor $DE");
    }
    last;
  }
}

## Find WM ##
while( (my $WMname, my $WMprocess) = each(%WMlist) ) {
 print "\::$textcolor Testing $WMname process: $WMprocess \n" unless $quite == 1;
  if ( $processes =~ m/$WMprocess/ ) {
    $WM = $WMname;
    print "\::$textcolor WM found as $WM\n" unless $quite == 1;
    if( $display =~ m/WM/ ) {
      push(@line, " WM:$textcolor $WM");
    }
    last;
  }
}

## Find WM theme ##
if ( $display =~ m/Win_theme/ ){
  switch($WM) {
    case "Openbox" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.config/openbox/rc.xml")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) {
        if( /<name>(.+)<\/name>/ ) {
          while ( $found == 0 ) {
            print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
            push(@line, " WM Theme:$textcolor $1");
            $found = 1;
          }
        }
      }
      close(FILE);
    }
    case "Metacity" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      my $gconf = `gconftool-2 -g /apps/metacity/general/theme`;
      print "\::$textcolor $WM theme found as $gconf\n" unless $quite == 1;
      chomp ($gconf);
      push(@line, " WM Theme:$textcolor $gconf");
    }
    case "Fluxbox" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.fluxbox/init")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) {
        if( /session.styleFile:.*\/(.+)/ ) {
          print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
          push(@line, " WM Theme:$textcolor $1");
        }
      }
      close(FILE);
    }
    case "Blackbox" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.blackboxrc")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) {
        if( /session.styleFile:.*\/(.+)/ ) {
          print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
          push(@line, " WM Theme:$textcolor $1");
        }
      }
      close(FILE);
    }
    case "Xfwm4" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      switch($DE) {
    case "Xfce4" {
          open(FILE, "$ENV{HOME}/.config/xfce4/mcs_settings/xfwm4.xml")
          || die "\e[0;31m<Failed>\n";
            while( <FILE> ) {
            if( /<option name="Xfwm\/ThemeName" type="string" value="(.+)"\/>/ ) {
              print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
              push(@line, " WM Theme:$textcolor $1");
            }
          }
            close(FILE);
    }
    case "Xfce4.6" {
      my $xfconf = `xfconf-query -c xfwm4 -p /general/theme`;
      chomp($xfconf);
      push(@line, " WM Theme:$textcolor $xfconf");
    }
      }    
    }
    case "Kwin" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.kde/share/config/kwinrc")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) {
        if( /PluginLib=kwin3_(.+)/ ) {
          print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
          push(@line, " WM Theme:$textcolor $1");
        }
      }
      close(FILE);
    }
    case "Enlightenment" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      my $remote = `enlightenment_remote -theme-get theme` ;
      if( $remote =~ m/.*FILE="(.+).edj"/ ) {
        print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
        push(@line, " WM Theme:$textcolor $1");
      }     
    }       
    case "IceWM" { 
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.icewm/theme")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) {
        if( /Theme="(.+)\/.*.theme/ ) {
          while( $found == 0 ) {
            print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
            push(@line, " WM Theme:$textcolor $1");
            $found = 1;
          }
        }
      }   
      close(FILE);
    }   
    case "PekWM" {
      print "\::$textcolor Finding $WM theme\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.pekwm/config")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) {
        if( /Theme.*\/(.*)"/ ) {
            print "\::$textcolor $WM theme found as $1\n" unless $quite == 1;
            push(@line, " WM Theme:$textcolor $1");
        }
      }
      close(FILE); 
    } 
  }   
}     
      
## Find Theme Icon and Font ##
if ( $display =~ m/[Theme, Icons, Font, Background]/) {
  switch($DE) {
    case "Gnome" {
      print "\::$textcolor Finding $DE variables\n" unless $quite == 1;
      if ( $display =~ m/Theme/ ) {
        my $gconf = `gconftool-2 -g /desktop/gnome/interface/gtk_theme`;
        chomp ($gconf);
        print "\::$textcolor GTK Theme found as $1\n" unless $quite == 1;
        push(@line, " GTK Theme:$textcolor $gconf");
      }
      if ( $display =~ m/Icons/ ) {
        my $gconf = `gconftool-2 -g /desktop/gnome/interface/icon_theme`;
        chomp ($gconf);
        push(@line, " Icons:$textcolor $gconf");
      } 
      if ( $display =~ m/Font/ ) {
        my $gconf = `gconftool-2 -g /desktop/gnome/interface/font_name`;
        chomp ($gconf);
        push(@line, " Font:$textcolor $gconf");
      }
      if ( $display =~ m/Background/ ) {
        my $gconf = `gconftool-2 -g /desktop/gnome/background/picture_filename`;
        chomp ($gconf);
        my $bname = basename($gconf);
        push(@line, " Background:$textcolor $bname");
      }

    } 
    case "Xfce4" {
      my @sort = ();
      print "\::$textcolor Finding $DE variables\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.config/xfce4/mcs_settings/gtk.xml")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) {
        if ( $display =~ m/Theme/ ) {
          if (/<option name="Net\/ThemeName" type="string" value="(.+)"\/>/ ) {
            print "\::$textcolor GTK Theme found as $1\n" unless $quite == 1;
            unshift(@sort, " GTK Theme:$textcolor $1");
          } 
        }
        if ( $display =~ m/Icons/ ) {
          if (/<option name="Net\/IconThemeName" type="string" value="(.+)"\/>/ ) {
            print "\::$textcolor Icons found as $1\n" unless $quite == 1;
            unshift(@sort, " Icons:$textcolor $1");
          }
        }
        if ( $display =~ m/Font/ ) {
          if ( /<option name="Gtk\/FontName" type="string" value="(.+)"\/>/ ) {
            print "\::$textcolor Font found as $1\n" unless $quite == 1;
            unshift(@sort, " Font:$textcolor $1");
          } 
        }
      }
      close(FILE);
      ## Sort variables so they're ordered "Theme Icon Font" ##
      foreach my $i (@sort) {
        push(@line, "$i");
      }
    } 
    case "Xfce4.6" {
      my @sort = ();
      print "\::$textcolor Finding $DE variables\n" unless $quite == 1;
        if ( $display =~ m/Theme/ ) {
        my $xfconf = `xfconf-query -c xsettings -p /Net/ThemeName`;
        chomp($xfconf);
            push(@line, " GTK Theme:$textcolor $xfconf");
        }
        if ( $display =~ m/Icons/ ) {
        my $xfconf = `xfconf-query -c xsettings -p /Net/IconThemeName`;
        chomp($xfconf);
            push(@line, " Icons:$textcolor $xfconf");
        }
        if ( $display =~ m/Font/ ) {
        my $xfconf = `xfconf-query -c xsettings -p /Gtk/FontName`;
        chomp($xfconf);
            push(@line, " Font:$textcolor $xfconf");
        }
      if ( $display =~ m/Background/ ) {
        my $xfconf = `xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path`;
        chomp($xfconf);
        my $bname = basename($xfconf);
            push(@line, " Background:$textcolor $bname");
      }
    } 
    case "KDE" { 
      print "\::$textcolor Finding $DE variables\n" unless $quite == 1;
      open(FILE, "$ENV{HOME}/.kde/share/config/kdeglobals")
      || die "\e[0;31m<Failed>\n";
      while( <FILE> ) { 
        if ( $display =~ m/Theme/ ) {
          if ( /widgetStyle=(.+)/  ) {
            print "\::$textcolor Wiget Style found as $1\n" unless $quite == 1;
            push(@line, " Wiget Style:$textcolor $1");
          }
          if (/colorScheme=(.+).kcsrc/ ) {
            print "\::$textcolor Color Scheme found as $1\n" unless $quite == 1;
            push(@line, " Color Scheme:$textcolor $1");
          }
        }
        if ( $display =~ m/Icons/ ) {
          if ( /Theme=(.+)/ ) {
            print "\::$textcolor Icons found as $1\n" unless $quite == 1;
            push(@line, " Icons:$textcolor $1");
          } 
        }   
        if ( $display =~ m/Font/ ) {
          if ( /font=(.+)/ ) {
            my $font = (split/,/, $1)[0];
            print "\::$textcolor Font found as $font\n" unless $quite == 1;
            push(@line, " Font:$textcolor $font");
          }
        }
      }
      close(FILE);
  
    }
    else {
      my @files = ("$ENV{HOME}/.gtkrc-2.0", "$ENV{HOME}/.gtkrc.mine",);
      foreach my $file (@files) {
        if ( -e $file ) {
          print "\::$textcolor Opening $file\n" unless $quite == 1; 
          open(FILE, $file)
          || die "\e[0;31m<Failed>\n";
          while( <FILE> ) {
            if ( $display =~ m/Theme/ ) {
              if( /include ".*themes\/(.+)\/gtk-(1|2)\.0\/gtkrc"/ ){
                print "\::$textcolor GTK theme found as $1\n" unless $quite == 1;
                push(@line, " GTK Theme:$textcolor $1");
              }
            }
            if ( $display =~ m/Icons/ ) {
              if( /.*gtk-icon-theme-name.*"(.+)"/ ) {
                print "\::$textcolor Icons found as $1\n" unless $quite == 1;
                push(@line, " Icons:$textcolor $1");
              }
            }
            if ( $display =~ m/Font/ ) {
              if( /.*gtk-font-name.*"(.+)"/ ) {
                print "\::$textcolor Font found as $1\n" unless $quite == 1;
                push(@line, " Font:$textcolor $1");
             }
            }
          }
          close(FILE);
        }
      }
    }
  }
}

## Display the system info ##

if ( $distro =~ m/Archlinux/ ) {

## Get Archlinux version ##
if ( $display =~ "OS"){
  print "\::$textcolor Finding Archlinux version\n" unless $quite == 1;
  my $version = $myArchVersion;
  $version =~ s/\s+/ /g;
  $version = " OS:$textcolor $version";
  unshift(@line, "$version");
}

my $c1 = "\e[1;36m";
my $c2 = "\e[0;36m";

system("clear");

print "
${c1}                   -`                   
${c1}                  .o+`                  
${c1}                 `ooo/                  
${c1}                `+oooo:                 
${c1}               `+oooooo:
${c1}               -+oooooo+:
${c1}             `/:-:++oooo+:                       $c1@line[0]
${c1}            `/++++/+++++++:                      $c1@line[1]
${c1}           `/++++++++++++++:                     $c1@line[2]
${c1}          `/+++${c2}ooooooooooooo/`                   $c1@line[3]
${c2}         ./ooosssso++osssssso+`                  $c1@line[4]
${c2}        .oossssso-````/ossssss+`                 $c1@line[5]
${c2}       -osssssso.      :ssssssso.                $c1@line[6]
${c2}      :osssssss/        osssso+++.               $c1@line[7]
${c2}     /ossssssss/        +ssssooo/-               $c1@line[8]
${c2}   `/ossssso+/:-        -:/+osssso+-    
${c2}  `+sso+:-`                 `.-/+oso:   
${c2} `++:.                           `-/+/  
${c2} .`                                  ``
${c2} 
\e[0m";
}

system("scrot -d 1");
