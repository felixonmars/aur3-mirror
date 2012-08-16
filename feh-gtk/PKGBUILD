# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=feh-gtk
pkgver=1.3a
pkgrel=2
pkgdesc="A simple GUI to choose and change your wallpaper using feh as a backend"
arch=('any')
url="http://devblog.homeunix.me"
license=('GPL2')
depends=('feh' 'pygtk' 'python2')
optdepends=('gnome-icon-theme: It is fussy about icon themes; this one works')
source=($url/share/debian/$pkgname/$pkgname.$pkgver.tar.gz)
md5sums=('b6bf9ebfb7162b2daeb2fef2870e4dee')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make prefix=/usr PYTHON=/usr/bin/python2
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" prefix=/usr PYTHON=/usr/bin/python2 install
}
