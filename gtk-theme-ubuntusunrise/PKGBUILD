# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/27/11

pkgname=gtk-theme-ubuntusunrise
pkgver=2.4.1
pkgrel=2
pkgdesc="Ubuntu sunrise theme for GTK2."
arch=(any)
license=('GPL')
depends=('gtk-engine-murrine>=0.98')
optdepends=('slim-theme-ubuntu-sunrise: matching theme for slim login manager')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/ubuntu-sunrise-theme_2.4.1.maverick.ppa2+nmu1.tar.gz
        arch-icon-darkorange.svg
        ub-sunrise.patch)
url="http://www.bisigi-project.org"
md5sums=('734a58479d96c695b4c708792b6ec1c1'
         '042d93e274eaab6ef4fcfe2383c0e7db'
         '2fe5dff8da6f88fc1536bc91ff72a86b')

package() {
   cd ${srcdir}/ubuntu-sunrise-theme
   # install dirs
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/nature,gnome-background-properties,emerald/themes,doc/bisigi/ubuntu-sunrise}
   tar -xzf Gtk/ubuntu-sunrise.tar.gz -C Gtk/
   #Icons theme
   echo "Unpacking icons..."
   tar -xjf Icons/ubuntu-sunrise.tar.bz2 -C Icons/
   rm -f Icons/ubuntu-sunrise/index.theme~
   install -D -m644 ${startdir}/arch-icon-darkorange.svg Icons/ubuntu-sunrise/scalable/places/distributor-logo.svg
   install -D -m644 ${startdir}/arch-icon-darkorange.svg Icons/ubuntu-sunrise/scalable/places/gnome-main-menu.svg
   install -D -m644 ${startdir}/arch-icon-darkorange.svg Icons/ubuntu-sunrise/scalable/places/start-here.svg
   cd Icons/ubuntu-sunrise/scalable/actions
   ln -s system-shutdown-panel.svg system-shutdown.svg
   cd ../../../..
   #Emerald theme
   mkdir Emerald/ubuntu-sunrise
   tar -xzf Emerald/ubuntu-sunrise.emerald -C Emerald/ubuntu-sunrise

   patch -Np0 <${srcdir}/ub-sunrise.patch
   cp -R Gtk/ubuntu-sunrise/ ${pkgdir}/usr/share/themes/
   cp -R Icons/ubuntu-sunrise/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/{A_day_at_the_savannah.jpg,A_day_at_the_savannah_wide.jpg} \
     ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/nature/
   install -D -m644 Wallpaper/ubuntu-sunrise-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   cp -R Emerald/ubuntu-sunrise ${pkgdir}/usr/share/emerald/themes/
   install -D -m644 credits.txt ${pkgdir}/usr/share/doc/bisigi/ubuntu-sunrise/
}
