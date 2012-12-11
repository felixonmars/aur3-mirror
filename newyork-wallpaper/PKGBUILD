# Maintainer: localizator <localizator@ukr.net>
pkgname=newyork-wallpaper
pkgver=1.0
pkgrel=1
pkgdesc="New York Wallpaper"
arch=(any)
url="http://sinine88.deviantart.com/art/New-York-264367293"
license=('CC-BY; CC-BY-SA')
depends=(xorg-server)
install=$pkgname.install
source=("http://localizator.googlecode.com/files/new_york_by_sinine88-d4deb3x.tar.gz")
md5sums=('f76eea4e3676f7d2385b836a1435b3e3')

screenshot=('http://i.imgur.com/qgFic.jpg')

build() {
  mkdir -p $pkgdir/usr/share/wallpapers
  chmod 755 -R $pkgdir/usr/share/wallpapers
  cd ${srcdir}
  cp -R 'New York' $pkgdir/usr/share/wallpapers/
}
