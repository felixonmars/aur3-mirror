# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Madek <gonzaloseguel@gmail.com>

pkgname=indicator-diodon
_name=diodon
pkgver=0.2.1
pkgrel=1
pkgdesc="GTK clipboard manager compatible with indicators."
arch=('i686' 'x86_64')
url="https://launchpad.net/pastie"
license=('GPL')
groups=('ayatana')
depends=('glib2' 'gtk2' 'dbus-glib' 'libgee' 'indicator-application' 'vala')
makedepends=()
source=(http://launchpad.net/${_name}/trunk/$pkgver/+download/${_name}-${pkgver}.tar.gz)
#        pastie.svg)



md5sums=('5056eab2641407f1135d365b0c17cd18')


build() {
  cd "$srcdir"/${_name}-$pkgver
  export PYTHON="/usr/bin/python2"
  sed -i 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' waf
  
  ./waf configure --prefix=/usr
  ./waf

  
}

package() {
  cd "$srcdir"/${_name}-$pkgver
  ./waf install -f --destdir=$pkgdir 
}
