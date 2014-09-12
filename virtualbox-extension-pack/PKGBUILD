# Maintainer: Christian Hesse <mail@eworm.de>
# Contributer: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>

pkgname=virtualbox-extension-pack
pkgver=4.3.16
pkgrel=1
pkgdesc='Oracle VM VirtualBox Extension Pack - Support for USB 2.0 devices, VirtualBox RDP and PXE boot for Intel cards'
arch=('i686' 'x86_64')
url='http://www.virtualbox.org/'
license=('custom')
depends=('virtualbox')
conflicts=('virtualbox-ext-oracle')
optdepends=('rdesktop: client to connect vm via RDP')
options=('!strip')
source=("http://download.virtualbox.org/virtualbox/${pkgver}/Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack")

if [[ "${CARCH}" = "i686" ]];  then
	installarch="linux.x86"
else
	installarch="linux.amd64"
fi

prepare() {
	tar --no-same-owner -xzf "${srcdir}/Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack" \
		"./${installarch}" ./ExtPack.signature ./ExtPack.manifest ./ExtPack-license.txt ./ExtPack.xml ./PXE-Intel.rom
	sed -i "/${installarch}/!d" ExtPack.manifest
}

package() {
	for FILE in ExtPack.manifest ExtPack.signature ExtPack.xml PXE-Intel.rom $(find ${installarch} -type f); do
		install -D -m0644 ${FILE} "${pkgdir}/usr/lib/virtualbox/ExtensionPacks/Oracle_VM_VirtualBox_Extension_Pack/${FILE}"
	done

	install -D -m0644 ExtPack-license.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

sha256sums=('93b01ac2c575388ea6ae994450907c24e30a788c271ae9ff18512a06f28d9abd')
