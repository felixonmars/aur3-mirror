# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vmware-view-client
pkgver=2.2.0
pkgrel=2
pkgdesc="VMware Horizon View Client connects to virtual machines managed by VMware Horizon View (proprietary version with PCoIP support)"
conflicts=('vmware-view-open-client' 'vmware-view-open-client-beta')
arch=('i686' 'x86_64')
url="https://my.vmware.com/web/vmware/info/slug/desktop_end_user_computing/vmware_view/5_0"
license=('custom')
source=("http://archive.canonical.com/pool/partner/v/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
	'vmware-view.png'
	'vmware-view.desktop')
depends=('gnome-icon-theme')
optdepends=('rdesktop: RDP remote desktop connections'
	'vmware-view-client-usb: USB devices redirection')
install=vmware-view-client.install

if [[ "${CARCH}" == 'x86_64' ]]; then
	_libprefix='lib32-'
else
	_libprefix=''
fi
# no spaces here
depends+=(${_libprefix}{'openssl098','gtk2','libxml2','libxtst','libxkbfile'})
optdepends+=(${_libprefix}{'alsa-lib: audio support via alsa','libpulse: audio support via pulse sound server','pcsclite: smartcard support'})

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# This is a dirty hack, but it works.
	# Change dynamic section in ELF files to link to libpng16.so
	# Make sure the length is not changed!
	sed -i -e 's/libpng12.so.0/libpng16.so\x0\x0/' \
		usr/bin/vmware-remotemks-container \
		usr/bin/vmware-view \
		usr/lib/pcoip/vchan_plugins/libmksvchanclient.so
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	for FILE in $(find -type f); do
		install -D ${FILE} ${pkgdir}/${FILE}
	done

	# desktop file and icon
	install -D -m0644 ${srcdir}/vmware-view.desktop ${pkgdir}/usr/share/applications/vmware-view.desktop
	install -D -m0644 ${srcdir}/vmware-view.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/vmware-view.png
}



sha256sums=('b011d4030b8227c3e39139905e6365b2ff9d32f8ed18a43f35b9c000b62a70c3'
            '5c5ea6ff244b798fbe1d276b95c9f5f7c047924bbc59341792e63d2be6d3b749'
            'af6893b96e07e9e8023d64eaa4cece90c73890d744e4d91d80cfdcd3120b60bd')
