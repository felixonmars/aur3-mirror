# $Id: PKGBUILD 46423 2009-07-18 07:32:07Z giovanni $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ctags-vala
pkgver=5.8
pkgrel=1
pkgdesc="Generates an index file of language objects found in source files.\
 With experiment vala support"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'vala' 'libgee')
provides=('ctags')
conflicts=('ctags')
#options=('!strip')
url="http://ctags.sourceforge.net/"
source=('http://bitbucket.org/marten/ctags/get/testing-2.tar.bz2')
sha256sums=('3e177dac543ed5960b03345991be7f559c1097ddbaa3cbd855b253adbe480ba5')

build() {
  cd ${srcdir}/ctags
  #CFLAGS="${CFLAGS} -ggdb" ./configure --enable-vala --prefix=/usr
  ./configure --enable-vala --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install
}

