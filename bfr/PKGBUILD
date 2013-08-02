# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Per Wigren <per.wigren@gmail.com>
# Maintainer: Nathan Owe <ndowens.aur at gmail.com>
pkgname=bfr
pkgver=1.6
pkgrel=6
pkgdesc="A general-purpose command-line pipe buffer."
arch=('i686' 'x86_64')
makedepends=('perl')
source=(http://www.sourcefiles.org/Utilities/Text_Utilities/$pkgname-$pkgver.tar.bz2)
md5sums=('a1aef17a259d78e81f133c149e2dbb80')
url="http://www.glines.org/software/bfr"
license=('GPL')
options=(!libtool)

build() {
 cd ${srcdir}/${pkgname}-${pkgver}
 ./configure --prefix=/usr --mandir=/usr/share/man
 sed -i 's:pod2man:/usr/bin/core_perl/pod2man:' Makefile
 make
}

package() {
 cd ${srcdir}/${pkgname}-${pkgver}
 make DESTDIR=${pkgdir} install
}
