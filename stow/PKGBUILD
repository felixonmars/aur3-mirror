# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>

pkgname=stow
pkgver=1.3.3
pkgrel=2
pkgdesc="GNU Stow is a program for managing the installation of software packages"
arch=('i686' 'x86_64')
depends=('perl')
install=(stow.install)
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://www.gnu.org/software/stow/"
license=('GPL2')
md5sums=('59a078c7056dd9dd97fb707063b69d03')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  gzip -9nf "$pkgdir/usr/share/info/stow.info"
  rm "$pkgdir/usr/share/info/dir"
}
