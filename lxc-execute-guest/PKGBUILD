# Maintainer: Spider.007 <archPackage@spider007.net>

pkgname=lxc-execute-guest
pkgver=0.8.0_rc2
pkgrel=1
pkgdesc="Linux Containers Guest module to use lxc-execute, install this package inside the container"
arch=('i686' 'x86_64')
url="http://lxc.sourceforge.net/"
depends=('libcap')
license=('LGPL')
source=("http://lxc.sourceforge.net/download/lxc/lxc-${pkgver/_/-}.tar.gz")
md5sums=('9bd6988542fd7dd198d056ef3a2db9f6')

build() {
  cd "$srcdir/lxc-${pkgver/_/-}"

  ./configure \
	--prefix=/usr \
	--localstatedir=/var \
	--libexecdir=/usr/bin \
	--sysconfdir=/etc \
	--disable-doc
  make
}

package() {
  cd "$srcdir/lxc-${pkgver/_/-}"

  make DESTDIR="$pkgdir" install

  cd $pkgdir

  rm -R usr/bin/lxc-* usr/lib/lxc/ usr/share/ usr/include/
}
