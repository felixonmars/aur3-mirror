# Maintainer: TDY <tdy@archlinux.info>

pkgname=rquota
pkgver=2.2.6
pkgrel=1
pkgdesc="A drop-in replacement for the quota and repquota utilities, supporting remote NFS and Lustre file systems"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rquota/"
license=('GPL')
depends=('glibc')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('89837188d18dcace077d557c383347ae')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
