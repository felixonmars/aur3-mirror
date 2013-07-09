# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/26/11

pkgname=gtk-theme-aquadreams
_pkgname=aquadreams-theme
pkgver=1.9.1
pkgrel=2
pkgdesc="Aquadreams theme for Xfce and Mate."
arch=(any)
license=('GPL')
depends=('gtk-engine-murrine>=0.98')
optdepends=('slim-theme-aquadreams: matching theme for slim login manager')
install=aquadreams.install
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/aquadreams-theme_1.9.1.maverick.ppa2.tar.gz
        arch-icon.svg
        aquadreams.patch)
url="http://www.bisigi-project.org"
md5sums=('8c7bb5dd3fd690aea704d82b20aa37c7'
         '7e749ffb77988ddba93a460942cd7a59'
         'e7102ad560fff8049a2f6b307490a26a')

package() {
   cd ${srcdir}/${_pkgname}
   # install dirs
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/other,gnome-background-properties,emerald/themes,doc/bisigi/aquadreams}

   tar -xzf Gtk/aquadreams.tar.gz -C Gtk/
   #Icons theme
   echo "Unpacking icons..."
   tar -xjf Icons/aquadreams.tar.bz2 -C Icons/
   install -D -m644 ${startdir}/arch-icon.svg Icons/aquadreams/scalable/places/distributor-logo.svg
   install -D -m644 ${startdir}/arch-icon.svg Icons/aquadreams/scalable/places/gnome-main-menu.svg
   install -D -m644 ${startdir}/arch-icon.svg Icons/aquadreams/scalable/places/start-here.svg
   cd Icons/aquadreams/scalable/actions
   ln -s system-shutdown-panel.svg system-shutdown.svg
   cd ../../../..
   #Emerald theme
   mkdir Emerald/aquadreams
   tar -xzf Emerald/aquadreams.emerald -C Emerald/aquadreams
   # install files
   patch -Np0 <${srcdir}/aquadreams.patch
   cp -R Gtk/aquadreams/ ${pkgdir}/usr/share/themes/
   cp -R Icons/aquadreams/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/{AquaDreams-wide.jpg,AquaDreams.jpg} ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/other
   install -D -m644 Wallpaper/aquadreams-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   cp -R Emerald/aquadreams ${pkgdir}/usr/share/emerald/themes/
   install -D -m644 credits ${pkgdir}/usr/share/doc/bisigi/aquadreams/credits.txt
}
