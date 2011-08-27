# Maintainer: Giorgio Gilestro <giorgio@gilestro.tk>
pkgname=ipupdate
pkgver=1.1.1
pkgrel=1
pkgdesc="IPUpdate: Not just a Dynamic IP Client"
url="http://ipupdate.sourceforge.net"
depends=('glibc')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}%20source/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz
	archlinux.patch)
md5sums=('88ad3ac097190055db4ba816b9d26d13'
	'5a9d51fceb0116d17dfc824566ec94d9')

build() {
  mkdir -p $pkgdir/etc
  mkdir -p $pkgdir/usr/share/man/man{7,8,5}
  mkdir -p $pkgdir/usr/sbin

  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i ../archlinux.patch || return 1
  make DESTDIR=$pkgdir install
}

