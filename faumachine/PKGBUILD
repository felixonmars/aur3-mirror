# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Thomas Karmann <thomas at krmnn dot de>

pkgname=faumachine
pkgver=20120707
pkgrel=1
pkgdesc="FAUmachine is an Open Source Virtual Machine"
arch=('i686' 'x86_64')
url="http://www3.informatik.uni-erlangen.de/Research/FAUmachine/"
license=('GPL')
depends=('fauhdlc' 'faucc' 'faumachine-bios' 'gtk2' 'libtheora' 'zenity')
makedepends=('xmlto' 'python2')
optdepends=('slirp: for network support')
source=(http://www3.informatik.uni-erlangen.de/Research/FAUmachine/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('da314792c9b6d1a205c2f46f8ed9d730')


prepare() {
  cd $pkgname-$pkgver

  sed -i "s|bin/python|bin/python2|g" scripts/check_license.py
  sed -i configure.ac -e "s/AC_PATH_PROG(python, python)/AC_PATH_PROG(python2, python2)/"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  unset LDFLAGS

  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man --disable-build-bios
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/share/faumachine/roms
}
