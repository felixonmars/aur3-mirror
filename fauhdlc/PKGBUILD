# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Thomas Karmann <thomas at krmnn dot de>
# Contributor: Laszlo Papp <djszapi at gmail com>

pkgname=fauhdlc
pkgver=20130704
pkgrel=1
pkgdesc="Experimental VHDL compiler and interpreter"
arch=('i686' 'x86_64')
url="http://www3.informatik.uni-erlangen.de/Research/fauhdlc/"
license=('GPL')
depends=('gc')
makedepends=('docbook-xsl' 'python2' 'xmlto')
source=(http://www3.informatik.uni-erlangen.de/Research/fauhdlc/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('590b0566dd411876ba4a0b32667a69a4')


prepare() {
  cd ${pkgname}-${pkgver}

  sed -i "s|env python|env python2|g" frontend/newparser/gen_parser_gen.py
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man --disable-Werror
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
