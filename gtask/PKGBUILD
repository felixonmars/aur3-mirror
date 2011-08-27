# Maintainer: Wilfried Fauvel <wilfried.fauvel at gmail>

pkgname=gtask
pkgver=0.1.2
pkgrev=59
pkgminor=565229c
pkgrel=1
pkgdesc='GTask is a mini-framework to simplify asynchronous and concurrent programming with C and GObject.'
arch=('i686' 'x86_64')
url='http://chergert.github.com/gtask/'
license=('LGPL')
depends=('gtk2' 'gtk-doc')
optdepends=('vala: vala biding support'
            'python: python biding support')
source=(http://github.com/chergert/gtask/tarball/master/chergert-${pkgname}-${pkgname}-${pkgver}-${pkgrev}-g${pkgminor}.tar.gz )
md5sums=('02bca5d2d615a57b0654e7c034c76b19')

build() {
  cd ${srcdir}/chergert-${pkgname}-${pkgminor}

  # Build
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

