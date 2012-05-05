# Maintainer: John Ray <localizator@ukr.net>
pkgname=blues-wallpaper
pkgver=1.0
pkgrel=1
pkgdesc="Blues Wallpeper"
arch=(any)
url="http://hyperdude111.deviantart.com/art/Blues-216472923"
license=('GPL')
depends=(xorg-server)
install=$pkgname.install
source=("http://content.wuala.com/contents/localizator/aur/Blues.zip")
md5sums=('c3cd4fb019e0d01d4f229c02ebb5f72f')

build() {
  cd ${srcdir}
  #For KDE
  mkdir -p $pkgdir/usr/share/wallpapers/Blues
  cp -R Blues/* $pkgdir/usr/share/wallpapers/Blues
  #For Gnome
  mkdir -p $pkgdir/usr/share/backgrounds/gnome
  cp -R Blues/contents/images/1920x1080.png  $pkgdir/usr/share/backgrounds/gnome
  mv $pkgdir/usr/share/backgrounds/gnome/1920x1080.png $pkgdir/usr/share/backgrounds/gnome/Blues.png
}

# vim:set ts=2 sw=2 et:
