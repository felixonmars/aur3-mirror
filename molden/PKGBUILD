# Maintainer: Billy Wayne McCann <thebillywayne ~et~ gmail.com>
# Former Maintainer: Thorsten Bonck <thorsten at bonck.net>
# Former Maintainer: Hector Mtz-Seara <hseara__*a*t*__gmail*.*com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgname=molden
pkgver=5.2.1
pkgrel=2
pkgdesc="Molecular builder and viewer of quantum chemistry calculations"
arch=('i686' 'x86_64')
url="http://www.cmbi.ru.nl/molden/molden.html"
license=('custom')
install=${pkgname}.install
groups=('science' 'chemistry')
depends=('glu' 'libxmu' 'mesa')
makedepends=('gcc-fortran')
provides=('molden' 'gmolden' 'ambfor' 'ambmd')
source=(ftp://ftp.cmbi.ru.nl/pub/molgraph/$pkgname/$pkgname$pkgver.tar.gz)

sha512sums=('fd89c1797869bc1fedc6c88f9e0a7930d6292afaf21b16c317ca1328ebb8df89e70e2f6ebfeff3493d2df7afed0cd955a0e8a9ad145529602af5de963111931a')

# contatenated $pkgname and $pkgver
_pkgnv=${pkgname}${pkgver%.*}


build() {
    cd "$srcdir"/$_pkgnv
  
    # rename the CopyRight file
    mv -f CopyRight LICENSE
  
    # make
    make molden gmolden ambfor/ambfor ambfor/ambmd || return 1
}

package() {
    # install binaries
    install -m755 -d "$pkgdir"/usr/bin
    install -m755 -t "$pkgdir"/usr/bin "$srcdir"/$_pkgnv/molden
    install -m755 -t "$pkgdir"/usr/bin "$srcdir"/$_pkgnv/gmolden
    install -m755 -t "$pkgdir"/usr/bin "$srcdir"/$_pkgnv/ambfor/{ambfor,ambmd}

    # install licenses 
    install -m755 -d "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname "$srcdir"/$_pkgnv/COMMERCIAL_LICENSE
    
    # install desktop file and icon
    install -m755 -d "$pkgdir"/usr/share/applications
    install -m644 -t "$pkgdir"/usr/share/applications/ ../$pkgname.desktop
    install -m755 -d "$pkgdir"/usr/share/pixmaps
    install -m644 -t "$pkgdir"/usr/share/pixmaps/ ../$pkgname.png 
}
