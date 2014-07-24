## Contributor: Khiem
pkgname=vconfig
pkgver=1.9
pkgrel=4
pkgdesc='802.1Q VLAN configuration utility'
arch=('i686' 'x86_64')
url='http://www.candelatech.com/~greear/vlan.html'
depends=('lib32-glibc' 'glibc')
license=('GPL')
source=('https://mirrors.kernel.org/gentoo/distfiles/vlan.1.9.tar.gz')
md5sums=('5f0c6060b33956fb16e11a15467dd394')

build() {
	cd vlan
	make clean all
}

package() {
	cd vlan
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/man/man8"
	install -m644 'vlan.html' "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 'README' "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 'CHANGELOG' "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 'howto.html' "${pkgdir}/usr/share/doc/${pkgname}"
	install -m755 'vconfig' "${pkgdir}/usr/bin"
	install -m755 'macvlan_config' "${pkgdir}/usr/bin"
	install -m644 'vconfig.8' "${pkgdir}/usr/share/man/man8"
}
