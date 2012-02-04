# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=sysvbanner
pkgver=1.0.15
pkgrel=1
pkgdesc="System-V banner clone"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/sysvbanner"
license=('custom')
conflicts=('bsd-games') # Both provides banner command
source=("http://ftp.debian.org/debian/pool/main/s/sysvbanner/${pkgname}_${pkgver}.tar.gz"
	"banner.1.patch"
	"LICENSE")
md5sums=('5a7bd216a42faa20bfd91268a77cc41d'
         '4e0050d07db8e600fda11d1cd7f0a887'
         '13f0ff934e12541c27befcbf75def050')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
