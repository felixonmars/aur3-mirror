# Contributor: phillipe <phillipe@archlinux.com.br>
pkgname=usbmanager
pkgver=1.0.0
pkgrel=1
pkgdesc="An USB storage management interface."
arch=('any')
url="https://launchpad.net/usbmanager"
depends=('hal' 'gtk2' 'python>=2.6' 'pygtk' 'python-notify')
optdepends=('mtools: to get the name [label] of the usb device.')
license=('GPL')
source=("http://launchpad.net/usbmanager/1.x/1.0.0/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('d51e01cf78e0c5b1628646e3652ea510')

build(){
	cd ${srcdir}/${pkgname}
	python setup.py install --root $pkgdir
	sed -i 's/^Exec=usbmanager/Exec=usbmanager --tray/' ${pkgdir}/usr/share/applications/${pkgname}.desktop
	rm -rf ${pkgdir}/root
}
