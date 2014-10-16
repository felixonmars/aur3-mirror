# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vmware-view-client-usb
pkgver=2.1.0
pkgrel=2
pkgdesc="Redirect USB devices to VMware Horizon View Clients"
arch=('i686' 'x86_64')
url="https://my.vmware.com/web/vmware/info/slug/desktop_end_user_computing/vmware_view/5_0"
license=('custom')
# http://archive.canonical.com/pool/partner/v/vmware-view-client/vmware-view-client_${pkgver}.orig.tar.gz
source=("http://www.eworm.de/download/linux/vmware-view-client_${pkgver}.orig.tar.gz"
	'tmpfiles.conf'
	'vmware-view-usbd'
	'vmware-view-usbd.service')
depends=('vmware-view-client'
	'gnome-icon-theme')
install=vmware-view-client-usb.install

if [[ "${CARCH}" == 'x86_64' ]]; then
	_libprefix='lib32-'
	depends+=('lib32-systemd')
else
	_libprefix=''
fi

prepare() {
	cd "${srcdir}/vmware-view-client-${pkgver}"

	# link to libudev.so.1
	sed -i -e 's/libudev.so.0/libudev.so.1/g' usr/lib/vmware/vmware-view-usbd
}

package() {
	cd "${srcdir}/vmware-view-client-${pkgver}"

	install -D -m4755 usr/lib/vmware/vmware-usbarbitrator ${pkgdir}/usr/lib/vmware/vmware-usbarbitrator
	install -D -m4755 usr/lib/vmware/vmware-view-usbd ${pkgdir}/usr/lib/vmware/vmware-view-usbd

	install -D -m0755 usr/lib/vmware/libcrypto.so.0.9.8 ${pkgdir}/usr/lib/vmware/libcrypto.so.0.9.8
	install -D -m0755 usr/lib/vmware/libssl.so.0.9.8 ${pkgdir}/usr/lib/vmware/libssl.so.0.9.8

	install -D -m0755 ${srcdir}/vmware-view-usbd ${pkgdir}/usr/lib/systemd/scripts/vmware-view-usbd
	install -D -m0644 ${srcdir}/vmware-view-usbd.service ${pkgdir}/usr/lib/systemd/system/vmware-view-usbd.service

	# this needs to be writeable for USB redirection
	install -d ${pkgdir}/var/run/vmware
	install -D -m0644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/vmware-view-client-usb.conf
}



sha256sums=('111c1d753a42c3c0eb1829f7a1bcc4d654f23458830f4727883dc6516ef2bb12'
            'ec763930dd50d6e77a31c40c939909752cfb124cafb0a4ca4f76860375a14d75'
            'cc03137151aae050f7cdb965d02488089a9e0ef7e03c21a13ea44036a3762b08'
            '021ce563b9a672fc5027fd83821561b2e34ea25c51c1d9cb9e84d905d45003e9')
