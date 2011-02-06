# Maintainer: snuo
# Contributor: snuo
pkgname=supertuxkart-extras
pkgver=0.6
pkgrel=3
pkgdesc="Extra karts and tracks not included in the offical release - only compatible with STK 0.6"
arch=(i686 x86_64)
url="http://supertuxkart.sourceforge.net"
license=('GPL')
depends=('supertuxkart<0.7')
makedepends=('p7zip')
source=("http://downloads.sourceforge.net/sourceforge/supertuxkart/karts.7z" "http://downloads.sourceforge.net/sourceforge/supertuxkart/tracks.7z")
md5sums=('d4868c6c93b570861a7c5e5b4550e604'
         'a197e96526d911c4d967f2fe41310203')
sha1sums=('7f0a6a19f25e5c70076ba0e767595bf2a70466dc'
          'bb03b1c9bd238dd5da15ce390429097ad431b714')

build() {
	mkdir -p ${pkgdir}/usr/share/supertuxkart/data/
	7z x -o${pkgdir}/usr/share/supertuxkart/data/ tracks.7z 
	7z x -o${pkgdir}/usr/share/supertuxkart/data/ karts.7z
	# Remove Mac specific files
	rm ${pkgdir}/usr/share/supertuxkart/data/karts/.DS_Store
	rm ${pkgdir}/usr/share/supertuxkart/data/tracks/.DS_Store
	rm ${pkgdir}/usr/share/supertuxkart/data/karts/adiumy/.DS_Store
	rm ${pkgdir}/usr/share/supertuxkart/data/karts/AUDAcity/.DS_Store
}
