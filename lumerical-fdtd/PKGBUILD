# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=lumerical-fdtd
pkgver=8.0.4
pkgrel=5
pkgdesc="High performance FDTD-method Maxwell solver for the design, analysis and optimization of nanophotonic devices, processes and materials. A 30-day trial license key can be procured from the vendor."
arch=('x86_64')
url="http://www.lumerical.com/"
license=('custom')
source=(
	'http://aur.causal.ca/archlinux/lumerical/FDTD-8.0.4-1.rhel5.x86_64.rpm'
	'lumerical-fdtd'
	'LICENSE'
)
depends=( 'libpng12' 'libjpeg6' 'libtiff3' 'hdf5' 'libxss' 'qtwebkit' 'mesa' 'libxft' )
makedepends=( 'rpmextract' )
package() {
	cd $pkgdir
	rpmextract.sh ${srcdir}/FDTD-8.0.4-1.rhel5.x86_64.rpm
	mkdir -p usr/lib
	ln -s libexpat.so usr/lib/libexpat.so.0
	install -Dm755 ${srcdir}/lumerical-fdtd ${pkgdir}/usr/bin/lumerical-fdtd
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
#
md5sums=('a47c38daf6ef745d6171ef33d2440c8e'
         'cdf1658bada32310a07564baa3c896db'
         '73234cc3776a656f53fc82e8eb92117b')
