# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-liblarch_gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK binding for liblarch"
arch=('i686' 'x86_64')
url="https://live.gnome.org/liblarch"
license=('LGPL3')
depends=('python2' 'python2-liblarch')
optdepends=()
makedepends=('python2')
provides=()
conflicts=()
source=("http://gtg.fritalk.com/publique/gtg.fritalk.com/liblarch/0.1/liblarch_gtk-${pkgver}.tar.gz")
md5sums=('8e277e4fc81c9292788b25c142d3703c')

build() {
  cd "$srcdir/liblarch_gtk-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

package() {
  find "${pkgdir}"/usr/lib/python2.7/site-packages/liblarch_gtk -name '*.py' | \
  xargs sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"
}

# vim:set ts=2 sw=2 et:
