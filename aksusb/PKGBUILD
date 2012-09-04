# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=aksusb
pkgver=1.15
pkgrel=2
pkgdesc="A daemon for facilitating license file retrieval. Used by lumerical software."
arch=( 'i386' 'x86_64' )
url="http://www.lumerical.com/"
install=install
license=('custom')
source=(
	'http://aur.causal.ca/archlinux/lumerical/aksusbd-1.15-1.i386.rpm'
	'arch-rc.d.patch'
	'LICENSE'
)
depends=( 'bash' 'lib32-glibc' )
makedepends=( 'rpmextract' )
package() {
	cd $pkgdir
	rpmextract.sh ${srcdir}/aksusbd-1.15-1.i386.rpm
	patch -i ../arch-rc.d.patch etc/init.d/aksusbd
	mv etc/init.d etc/rc.d
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
#
md5sums=('21eb7c7ecc5e27f713d3bd1fe5690ff4'
         '38f0914eb035919ee54843e05cab8d32'
         '73234cc3776a656f53fc82e8eb92117b')
