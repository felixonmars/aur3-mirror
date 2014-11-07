# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgbase=utax-3050i-series
pkgname=utax-3050i-series
pkgver=2014.01.15
pkgrel=2
epoch=
pkgdesc="CUPS driver from UTAX homepage for the 3050i series, i.e. 3650i and 3050i. Note, then manufacturer is Kyocera."
arch=(x86_64)
url="http://www.utax.de/"
license=('unknown')
groups=()
depends=(libcups)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://www.utax.de/C125712200447418/vwLookupDownloads/TALinuxPackages_cCD-cLP_20140115.tar.gz/\$FILE/TALinuxPackages_cCD-cLP_20140115.tar.gz')
	
noextract=()
sha256sums=('d5031282b32266912f08c9f9b19b092c93e8aabda925d83a505e48e185e172ad')

package() {
	cd "$srcdir/LinuxPackagesTA/3060i series/64bit/EU/English/"
	
	install -d $pkgdir/usr/share/cups/model/UTAX_TA
	install TA3560i.PPD TA3060i.PPD -m 444 $pkgdir/usr/share/cups/model/UTAX_TA
	install -d $pkgdir/usr/lib/cups/filter
	install kyofilter_B -m 555 $pkgdir/usr/lib/cups/filter
}
