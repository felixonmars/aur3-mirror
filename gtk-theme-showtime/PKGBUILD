# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 01/27/11

pkgname=gtk-theme-showtime
_pkgname=showtime-theme
pkgver=1.3.1
pkgrel=2
pkgdesc="Showtime theme for Xfce and Mate."
arch=(any)
depends=('gtk-engine-murrine>=0.98')
makedepends=('imagemagick')
optdepends=('slim-theme-showtime: matching theme for slim login manager')
license=('GPL')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/showtime-theme_1.3.1.maverick.ppa2+nmu1.tar.gz
        arch-icon-128.png
        showtime.patch)
url="http://www.bisigi-project.org"
md5sums=('e398bfe54bb4c0524e7ce5c3c92bd723'
         '5e7318b77e6ddb74b2fdf72788d7c5cc'
         '2e57049d13347a7796933262a0a10698')

package() {
   cd ${srcdir}/${_pkgname}
   # install dirs
   install -d ${pkgdir}/usr/share/{themes,icons,pixmaps/backgrounds/gnome/other,gnome-background-properties,emerald/themes,doc/bisigi/showtime}
   tar -xzf Gtk/showtime.tar.gz -C Gtk/
   #Icons theme
   echo "Unpacking icons..."
   tar -xjf Icons/showtime.tar.bz2 -C Icons/
   local _w=""
   for _w in {16x16,22x22,24x24,32x32,48x48}; do
      convert -resize $_w ${startdir}/arch-icon-128.png Icons/showtime/$_w/places/distributor-logo.png
      convert -resize $_w ${startdir}/arch-icon-128.png Icons/showtime/$_w/places/gnome-main-menu.png
      convert -resize $_w ${startdir}/arch-icon-128.png Icons/showtime/$_w/places/start-here.png
   done
   install -D -m644 ${startdir}/arch-icon-128.png Icons/showtime/scalable/places/distributor-logo.png
   install -D -m644 ${startdir}/arch-icon-128.png Icons/showtime/scalable/places/gnome-main-menu.png
   install -D -m644 ${startdir}/arch-icon-128.png Icons/showtime/scalable/places/start-here.png
   #Emerald theme
   mkdir Emerald/showtime
   tar -xzf Emerald/showtime.emerald -C Emerald/showtime
   patch -Np0 <${srcdir}/showtime.patch
   cp -R Gtk/showtime/ ${pkgdir}/usr/share/themes/
   cp -R Icons/showtime/ ${pkgdir}/usr/share/icons
   install -D -m644 Wallpaper/showtime.jpg ${pkgdir}/usr/share/pixmaps/backgrounds/gnome/other
   install -D -m644 Wallpaper/showtime-wallpaper.xml ${pkgdir}/usr/share/gnome-background-properties
   cp -R Emerald/showtime ${pkgdir}/usr/share/emerald/themes/
   install -D -m644 credits.txt ${pkgdir}/usr/share/doc/bisigi/showtime/
}
