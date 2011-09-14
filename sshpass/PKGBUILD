# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sebastien Vasey sebastien dot vasey at gmail dot com

pkgname=sshpass
pkgver=1.05
pkgrel=1
pkgdesc="Fool ssh into accepting an interactive password non-interactively"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/sshpass/"
license=('GPL')
depends=('openssh')
source=(http://downloads.sourceforge.net/sshpass/sshpass-1.05.tar.gz)
md5sums=('c52d65fdee0712af6f77eb2b60974ac7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
