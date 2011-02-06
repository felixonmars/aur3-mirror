# Contributor: ugaciaka <ugaciaka@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=iitalian
pkgver=2.3
pkgrel=2
pkgdesc="Italian dictionary for Ispell"
arch=('any')
url="http://members.xoom.alice.it/_XOOM/trasforma/ispell/index.html"
license=('GPL')
depends=('ispell')
source=(http://ftp.de.debian.org/debian/pool/main/i/$pkgname/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('c476eabcf2802b2f4a1068e505bf83d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make || return 1
  install -D -m644 italian.aff "$pkgdir/usr/lib/ispell/italian.aff" || return 1
  install -m644 italian.hash "$pkgdir/usr/lib/ispell/" || return 1
  ln -s italian.hash "$pkgdir/usr/lib/ispell/italiano.hash" || return 1
}
