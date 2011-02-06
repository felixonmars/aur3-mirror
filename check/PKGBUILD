# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=check
pkgver=0.9.8
pkgrel=1
pkgdesc="A unit testing framework for C"
arch=('i686' 'x86_64')
url="http://check.sourceforge.net/"
license=('LGPL')
options=('!libtool')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5d75e9a6027cde79d2c339ef261e7470')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install

#get rid of the package's info directory, install-info adds entries for us at install-time
  rm ${pkgdir}/usr/share/info/dir || return 1
}
