# Contributor Madek <gonzaloseguel@gmail.com>

pkgname=indicator-usb
pkgver=0.2.1
pkgrel=1
arch=('any')
pkgdesc="USB disk manager for indicator"
url="https://github.com/Eugeny/indicator-usb"
license=('GPL')
depends=('indicator-application' 'python-appindicator')
makedepends=('libtool' 'intltool')
replaces=()
conflicts=()
provides=()
source=(http://dl.dropbox.com/u/7138409/indicator-usb/indicator-usb-0.2.1.deb)
md5sums=('3b01fa2361e671b02d0115b7fd64669e')

build() {
deb2targz indicator-usb-0.2.1.deb
tar xzf indicator-usb-0.2.1.tar.gz
find . -name indicator-usb -exec sed -i 's/env python/env python2/g' {} \;
cp -r usr/ ${pkgdir}/usr
}
