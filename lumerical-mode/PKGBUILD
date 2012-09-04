# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=lumerical-mode
pkgver=5.0.6
pkgrel=1
pkgdesc="Versatile waveguide mode solver and propagation simulators for the design, analysis and optimization of waveguide devices, components and subsystems. A 30-day trial license key can be procured from the vendor."
arch=( 'i386' 'x86_64' )
url="http://www.lumerical.com/"
license=('custom')
src='MODE-5.0.6-1.rhel4.i386.rpm'
if [ "$CARCH" == "x86_64" ]; then
	src='MODE-5.0.6-1.rhel5.x86_64.rpm'
fi
source=(
	'http://aur.causal.ca/archlinux/lumerical/'$src
	'lumerical-mode'
	'LICENSE'
)
depends=( 'libpng12' 'libjpeg6' 'libtiff3' 'qt' 'libxml2' 'mesa' )
makedepends=( 'rpmextract' )
optdepends=( 'lumerical-fdtd: contains the hasplm vendor file for all lumerical products' )
package() {
	cd $pkgdir
	rpmextract.sh ${srcdir}/${src}
	rm -rf var
	install -Dm755 ${srcdir}/lumerical-mode ${pkgdir}/usr/bin/lumerical-mode
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
#
md5sums=('8b6acb570428b2b67a4d9a776e421123'
         'c89ede2e97678e987be7bc8681c3935c'
         '73234cc3776a656f53fc82e8eb92117b')
if [ "$CARCH" == "x86_64" ]; then
	md5sums=('00df42af43383e68f541f1dd743937a1'
         'c89ede2e97678e987be7bc8681c3935c'
         '73234cc3776a656f53fc82e8eb92117b')
fi
