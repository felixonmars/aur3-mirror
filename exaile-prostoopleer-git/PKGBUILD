# Maintainer: Denis Moiseev <imdens@gmail.com>
pkgname=exaile-prostoopleer-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Listen music from prostopleer.com"
arch=('any')
license=('GPL')
url="http://github.com/mibbim"
depends=(exaile gstreamer0.10-ugly gstreamer0.10-ugly-plugins gnome-python-extras libgtkhtml)
makedepends=(git)
package() {
  mkdir -p $pkgdir/usr/share/exaile/plugins
  cd $pkgdir/usr/share/exaile/plugins/
  git clone https://github.com/mibbim/exaile_prostopleer.git
}
