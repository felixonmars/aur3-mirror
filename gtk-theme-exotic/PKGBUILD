# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/26/11

pkgname=gtk-theme-exotic
pkgver=1.6.1
pkgrel=2
pkgdesc="Exotic theme for Xfce and Mate."
arch=(any)
license=('GPL')
depends=('gtk-engine-murrine>=0.98')
optdepends=('slim-theme-exotic: matching theme for slim login manager')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/exotic-theme_1.6.1.maverick.ppa2+nmu1.tar.gz
        arch-icon-darkorange.svg
        exotic.patch)
url="http://www.bisigi-project.org"
md5sums=('73c8dddeedf5df33b39a59b8f3d767ad'
         '042d93e274eaab6ef4fcfe2383c0e7db'
         'fd402dce9447a3c892de639be5c05ea7')

package() {
   cd ${srcdir}/exotic-theme
   # install dirs
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/nature,gnome-background-properties,emerald/themes,doc/bisigi/exotic}

   tar -xzf Gtk/exotic.tar.gz -C Gtk/
   #Icons theme
   echo "Unpacking icons..."
   tar -xjf Icons/exotic.tar.bz2 -C Icons/
   install -D -m644 ${startdir}/arch-icon-darkorange.svg Icons/exotic/scalable/places/distributor-logo.svg
   install -D -m644 ${startdir}/arch-icon-darkorange.svg Icons/exotic/scalable/places/gnome-main-menu.svg
   install -D -m644 ${startdir}/arch-icon-darkorange.svg Icons/exotic/scalable/places/start-here.svg
   cd Icons/exotic/scalable/actions
   ln -s system-shutdown-panel.svg system-shutdown.svg
   cd ../../../..
   #Emerald theme
   mkdir Emerald/exotic
   tar -xzf Emerald/exotic.emerald -C Emerald/exotic/

   patch -Np0 <${srcdir}/exotic.patch
   cp -R Gtk/exotic/ ${pkgdir}/usr/share/themes/
   cp -R Icons/exotic/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/exotic.jpg ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
   install -D -m644 Wallpaper/exotic-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   cp -R Emerald/exotic ${pkgdir}/usr/share/emerald/themes/
   install -D -m644 credits.txt ${pkgdir}/usr/share/doc/bisigi/exotic/
}
