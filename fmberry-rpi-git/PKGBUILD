#Maintainer: cpaulus (paulus.cyril@gmail.com)

pkgname=fmberry-rpi-git
_realname=FMBerry
pkgver=f1ca86c
pkgrel=1
pkgdesc="A piece of software to broadcast on FM waves with a RPI"
arch=('any')
url=('http://github.com/Manawyrm/FMBerry')
license=('MIT')
depends=('i2c-tools' 'confuse' 'gnu-netcat')
makedepends=('git')
source=("git://github.com/Manawyrm/FMBerry"
	"fmberry.service")
md5sums=('SKIP'
	'33156c9a79114aa5664f0cfb72171da2')
install=fmberry.install

pkgver() {
  cd "${srcdir}/${_realname}"
  git describe --always | sed 's|-|.|g'
}

build() {
	cd "${srcdir}/${_realname}"
	make
}

package() {
    cd "${srcdir}/${_realname}"
    mkdir -p ${pkgdir}/etc/
    mkdir -p ${pkgdir}/usr/bin
    install -m 644 fmberry.conf ${pkgdir}/etc/fmberry.conf
    install fmberryd ${pkgdir}/usr/bin
    install ctlfmberry ${pkgdir}/usr/bin
    install -Dm0644 ${srcdir}/fmberry.service ${pkgdir}/usr/lib/systemd/system/fmberry.service
}