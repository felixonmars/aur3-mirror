# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname='libgse-bzr'
pkgver=54
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Generic Stream Encapsulation library"
url="https://launchpad.net/libgse"
license=('LGPL3')
depends=('libpcap')
makedepends=('bzr')
provides=('libgse')
conflicts=('libgse')
options=('!libtool')
source=('bzr+lp:libgse')
md5sums=('SKIP')

_bzrtrunk=lp:libgse
_bzrmod=libgse

pkgver() {
  cd "$srcdir/$_bzrmod"
  bzr revno
}

build() {
  cd $_bzrmod
  aclocal
  libtoolize --force
  autoconf
  autoheader
  automake --add-missing

  chmod +x ./configure
  ./configure --prefix=/usr \
              --disable-static
  make
}

check() {
  cd $_bzrmod
  make -k check
}

package() {
  cd $_bzrmod
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
