# Mantainer: Marty Plummer <ntzrmtthihu777@gmail.com>
pkgname=('rt5572sta')
pkgver=('2.613')
pkgrel=3
pkgdesc='kernel module and firmware for DLink DWA-160 B2 wifi dongle'
arch=('any')
url='http://code.google.com/p/rt5572sta/'
license=('GPL')
depends=('dkms' 'wpa_supplicant')
makedepends=('linux-headers'
	     'git')
conflicts=()
provides=()
options=('!strip')
install=$pkgname.install
source=(git://github.com/ntzrmtthihu777/rt5572sta.git#branch=master)
md5sums=('SKIP')

package() {
    cp -RL ${srcdir}/${pkgname}/usr ${pkgdir}/
    cp -RL ${srcdir}/${pkgname}/lib ${pkgdir}/
}
