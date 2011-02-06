# $Id$
# Maintainer: Hugo Doria <hugo@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=boo-0.8.2
_pkgname=boo
pkgver=0.8.2.2960
pkgrel=1
pkgdesc="A wrist friendly language for the CLI"
arch=('i686' 'x86_64')
url="http://boo.codehaus.org/"
license=('GPL')
depends=('mono')
replaces=('boo')
conflicts=('boo')
provides=("boo=${pkgver}")
source=(http://dist.codehaus.org/boo/distributions/${_pkgname}-${pkgver}.tar.gz)
md5sums=('547bb405c3a01d4812b3ebd046dd83ce')
options=('!makeflags')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p $MONO_SHARED_DIR
  cd ${srcdir}/${_pkgname}-${pkgver}
  sed -i -e 's|/lib|/lib/mono|' extras/boo.pc.in  || return 1
  ./configure --prefix=/usr
  make VERBOSE=1 || return 1
  make DESTDIR=${pkgdir} install || return 1
  rm -rf $MONO_SHARED_DIR  || return 1
  rm -rf ${pkgdir}/share/ || return 1
  rm -rf ${pkgdir}/usr/share/gtksourceview-1.0/language-specs/boo.lang
}

