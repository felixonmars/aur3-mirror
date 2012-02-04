# Maintainer: pisuka <tekmon@gmail.com>
# Contributor: Geoff Teale <tealeg@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=python-xklavier
pkgver=0.4
pkgrel=3
pkgdesc="Python Bindings for libxklavier."
arch=('i686' 'x86_64')
url="http://devel.randomink.org/projects/python-xklavier"
license=('LGPL')
depends=('libxklavier>=5.0' 'python2>=2.5' 'pygobject>=2.6.2' 'gtk2')
makedepends=('python2>=2.5')
source=("http://dl.dropbox.com/u/9994220/${pkgname}-${pkgver}.tar.gz")
md5sums=('25c922c12bff8eb03de56e1cf914b1f4')
options=('!libtool')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PYTHON=python2 ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
