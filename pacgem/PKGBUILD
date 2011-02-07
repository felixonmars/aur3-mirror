# Contributor: Daniel Mendler <mail@daniel-mendler.de>

pkgname=pacgem
pkgver=0.5
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('Ruby')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('f18b46119a7c7cdf5f2556f36492a840513176dfbbfd167c7ef1cfbc26f22df8'
	    'f9e61c353d200c5f3aca4ff3031a90966ec88767c746454130e18a8f8dea94c5')

build() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
