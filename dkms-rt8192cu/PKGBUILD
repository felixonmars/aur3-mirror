# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: David Herrmann <dh.herrmann@googlemail.com>

pkgname=("dkms-rt8192cu")
_pkgname="${pkgname#dkms-}"
pkgver=3.4.3.4369.20120622
pkgrel=1
pkgdesc="Driver for Realtek RTL8188CUS (8188C, 8192C) wireless chipset"
arch=("i686" "x86_64" "armv7h")
url="http://github.com/dvdhrm/${_pkgname}"
license=("GPL")
depends=("linux")
provides=("rt8192cu")
replaces=("rt8192cu")
conflicts=("rt8192cu")
depends=("dkms")
source=("https://github.com/downloads/dvdhrm/${_pkgname}/${_pkgname}-${pkgver}.tar.gz" \
	"dkms.conf.in" \
	"${pkgname}.install")
install="${pkgname}.install"
md5sums=("7aed2ccee156bafcef5a0126044f47ee" \
         "36b24ea01fc6965dbae993063bcc39c2" \
         "10232c539e2d2e8577182418d473eff6")

build() {
	cd "${srcdir}/${_pkgname}-$pkgver"
	if [ "${CARCH}" = "armv7h" ]; then
		sed -e "s/\$(shell uname -m.*/\"arm\"/" -i Makefile
	fi
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm644 "${srcdir}/dkms.conf.in" \
		"${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
	install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	cp -a * "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
}
