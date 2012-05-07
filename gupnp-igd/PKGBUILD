# Maintainer: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=gupnp-igd
pkgver=0.2.1
pkgrel=2
pkgdesc="A library to handle UPnP IGD port mapping"
arch=('i686' 'x86_64')
url="http://www.gupnp.org"
license=('LGPL')
depends=('gupnp>=0.18' 'glib2>=2.14' 'pygobject>=2.0')
makedepends=('gettext' 'pkgconfig')
options=('!libtool')
source=("http://www.gupnp.org/sites/all/files/sources/${pkgname}-${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export PYTHON="python2"
  ./configure --prefix=/usr \
              --disable-dependency-tracking \
              --disable-gtk-doc
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
md5sums=('03be8a80e2862cf72b2c50d65043828c')
