# Maintainer: yugrotavele <yugrotavele at archlinux dot us>

pkgname=nautilus-jungledisk
_subver=0
pkgver=1.${_subver}
pkgrel=2
pkgdesc="Jungle Disk Desktop public file sharing extension plug-in for Nautilus"
arch=('any')
url="http://www.jungledisk.com/"
license=('GPL')
depends=('junglediskdesktop>=3.100' 'nautilus' 'libgnomeui')
source=(http://downloads.jungledisk.com/31beta/${pkgname}-1.${_subver}.tar.gz)
sha1sums=(d0831f2b35b87c14b2d268efe0b2b3b4b6d8b35a)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

