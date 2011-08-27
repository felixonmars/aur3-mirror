
# Maintainer: Genosh <genosh (at) quasiquote.me>

pkgname=racket-textual
pkgver=5.0.2
pkgrel=1
pkgdesc="Lightweight CLI subset of the Racket environment."
arch=('i686' 'x86_64')
url="http://racket-lang.org"
license=('LGPL')
depends=('gcc-libs')
options=('!makeflags' '!strip')
source=(http://download.racket-lang.org/installers/${pkgver}/${pkgname}/${pkgname}-${pkgver}-src-unix.tgz)
md5sums=('71bd0959d15b4f3ae2a25de4db4af679')
sha1sums=('2ddecfba1287ba2a16061e8cd33c9d718e27abc6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

