# Maintainer: Denis Moiseev <imdens@gmail.com>
pkgname=exaile-vk-git
pkgver=0.0.3
pkgrel=0
pkgdesc="Listen music from vk.com"
arch=('any')
license=('GPL')
url="http://github.com/vrtx64/vk_exaile"
depends=(exaile gstreamer0.10-ugly gstreamer0.10-ugly-plugins gnome-python-extras libgtkhtml)
makedepends=(git)
package() {
  mkdir -p $pkgdir/usr/share/exaile/plugins
  cd $pkgdir/usr/share/exaile/plugins/
  git clone git://github.com/vrtx64/vk_exaile.git
}
