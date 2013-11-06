# Maintainer: blackleg <hectorespertpardo@gmail.com>


pkgname=flightgear-linuxtrack
pkgver=0.99.6
pkgrel=2
pkgdesc="Software for head motion tracking on linux."
arch=('any')
url="http://code.google.com/p/linux-track/"
license=('MIT License')
depends=('flightgear' 'linuxtrack')

source=(http://linuxtrack.eu/repositories/universal/linuxtrack-${pkgver}.tar.bz2)
md5sums=('4a84a46532442ad2aa8611ab1e5c8e80')


package() {
	cd "$srcdir/linuxtrack-${pkgver}/doc/fgfs"

	mkdir -p "$pkgdir/usr/share/flightgear/data"

	cp -r {Input,Nasal,Protocol} "$pkgdir/usr/share/flightgear/data/"


}
