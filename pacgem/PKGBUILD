# Contributor: Daniel Mendler <mail@daniel-mendler.de>

pkgname=pacgem
pkgver=0.7
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('Ruby')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('ae193417f5717d73d02486b1a84aa623ab53b47a1d7f14810c073d97029fb348'
	    'b843385642f77fe177f754ace2012865e33f23df52bda86d0c44dd75e78f4a13')

build() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
