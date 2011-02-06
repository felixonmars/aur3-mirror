# Maintainer: Trizen <trizen at go dot ro>

pkgname=online-photo-viewer
pkgver=0.1
pkgrel=1
pkgdesc="View random images from Panoramio.com in GQView."
arch=('any')
url="http://trizen.go.ro/"
license=('GPL')
depends=('perl-libwww' 'gqview' 'gnome-terminal')
source=(http://trizen.go.ro/files/online-photo-viewer)
noextract=()
md5sums=('30732bbfa0f4caa01b30351c92a21bb4')

build() {
  install -Dm 755 $srcdir/online-photo-viewer $pkgdir/usr/bin/online-photo-viewer
}
