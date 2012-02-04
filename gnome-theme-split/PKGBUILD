# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/28/2011

pkgname=gnome-theme-split
_pkgname=split-theme
pkgver=1.5.1
pkgrel=2
pkgdesc="Split theme for Gnome."
arch=(any)
license=('GPL')
depends=('gtk-engine-murrine>=0.98' 'xcursor-vanilla-dmz')
optdepends=('slim-theme-split: matching theme for slim login manager')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/split-theme_1.5.1.maverick.ppa2.tar.gz
        arch-icon-64.svg
        arch-icon-48.svg
        arch-icon-24.svg
        arch-icon-22.svg
        arch-icon-16.svg
        split.patch)
install=('split.install')
url="http://www.bisigi-project.org"
md5sums=('cf5c204758cb1f1a3e05859ae7bb23fe'
         '7b6cf784aa57bb00627d6c5671370490'
         'd9ca3f533d8f1f4d6a39151287694215'
         '58cf478d63320c2b6dc4671b908cfeb1'
         '8e7fee479f2712662dbc796dd714bef1'
         '18b79fde3758cce58d421ba3c2933e1d'
         '202266f8a6a0e31683f99f6221f5be33')

package() {
   cd ${srcdir}/Maverick
   # install dirs
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/other,gnome-background-properties,doc/bisigi/split}

   tar -xzf Gtk/split.tar.gz -C Gtk/
   #Icons theme
   echo "Unpacking icons..."
   tar -xjf Icons/split.tar.bz2 -C Icons/
   # remove svg that prevent arch logo to be displayed in main menu
   rm -f Icons/split/apps/{22,24}/start-here.svg
   rm -f Icons/split/{AUTHORS,COPYING}
   local _w=""
   for _w in {16,22,24,48,64} ; do
      cd ${srcdir}/Maverick/Icons/split/places/$_w
      rm -f {distributor-logo,gnome-main-menu,novell-button}.svg
      install -D -m644 ${startdir}/arch-icon-$_w.svg start-here.svg
      ln -s start-here.svg distributor-logo.svg
      ln -s start-here.svg gnome-main-menu.svg
      ln -s start-here.svg novell-button.svg
   done
   cd ${srcdir}/Maverick
   # install files
   patch -Np0 <${srcdir}/split.patch
   cp -R Gtk/split/ ${pkgdir}/usr/share/themes/
   cp -R Icons/split/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/split.jpg ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/other
   install -D -m644 Wallpaper/split-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   install -D -m644 credits ${pkgdir}/usr/share/doc/bisigi/split/credits.txt
}
