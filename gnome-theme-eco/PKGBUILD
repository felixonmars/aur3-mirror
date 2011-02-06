# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/28/2011

pkgname=gnome-theme-eco
_pkgname=eco-theme
pkgver=1.5.1
pkgrel=2
pkgdesc="Eco theme for Gnome."
arch=(any)
license=('GPL')
depends=('gtk-engine-murrine>=0.98' 'xcursor-vanilla-dmz')
#optdepends=('slim-theme-eco: matching theme for slim login manager')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/eco-theme_1.5.1.maverick.ppa2.tar.gz
        arch-icon.svg
        eco.patch)
install=('eco.install')
url="http://www.bisigi-project.org"
md5sums=('a1b3c316573d6b3b08189890aa2724b3'
         '7e749ffb77988ddba93a460942cd7a59'
         '5e4aeb933c3f6d48449ab56cefe47755 ')

package() {
   cd ${srcdir}/maverick
   # install dirs
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/other,gnome-background-properties,doc/bisigi/eco}

   tar -xzf Gtk/eco.tar.gz -C Gtk/
   #Icons theme
   echo "Unpacking icons..."
   tar -xjf Icons/eco.tar.bz2 -C Icons/
   local _w=""
   for _w in {16,22,24,48,64}; do
      cp ${startdir}/arch-icon.svg Icons/eco/places/$_w/distributor-logo.svg
      cp ${startdir}/arch-icon.svg Icons/eco/places/$_w/gnome-main-menu.svg
      cp ${startdir}/arch-icon.svg Icons/eco/places/$_w/start-here.svg
   done
   # remove svg that prevent arch logo to be displayed in main menu
   rm -f Icons/eco/apps/{22,24}/start-here.svg
   rm -f Icons/eco/{AUTHORS,COPYING}
   # install files
   patch -Np0 <${srcdir}/eco.patch
   cp -R Gtk/eco/ ${pkgdir}/usr/share/themes/
   cp -R Icons/eco/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/eco.png ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/other
   install -D -m644 Wallpaper/eco-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   install -D -m644 credits ${pkgdir}/usr/share/doc/bisigi/eco/credits.txt
}
