# Maintainer: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=ez-ipupdate
pkgver=3.0.11b8
pkgrel=4
pkgdesc="A small utility for updating your host name using dyn.dns services."
url="http://www.ez-ipupdate.com"
depends=('glibc')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://ftp.halifax.rwth-aachen.de/gentoo/distfiles/$pkgname-$pkgver.tar.gz
	ez-ipupdate.patch)
md5sums=('000211add4c4845ffa4211841bff4fb0'
         '51a2d92194d44323bbc710340f42e3b9')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 < $srcdir/ez-ipupdate.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  for i in *.conf; do
    sed -i "s:local/bin/ez-ipupdate:bin/ez-ipupdate:g" ${i}
    install -D -m 755 ${i} $pkgdir/usr/share/ez-ipupdate/configs/${i}
  done
}
