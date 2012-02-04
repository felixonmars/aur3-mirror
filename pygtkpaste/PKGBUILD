# Maintainer: Nic0 <nicolas.caen@gmail.com>
# Contributor: Nic0 <nicolas.caen@gmail.com>

pkgname=pygtkpaste
pkgver=0.2
pkgrel=2
pkgdesc="A python front end for pastebin.com use"
url="http://www.nicosphere.net/pygtkpaste-une-application-gui-pour-pastebin-com-1836/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2' 'pygtk')
source=(http://src.nicosphere.net/$pkgname/$pkgname-$pkgver.py)
md5sums=('7e9188c2a5a12860349fc7efd676bff9')

build() {
    cd ${srcdir}
    install -d ${pkgdir}/usr/bin
    cp ${pkgname}-${pkgver}.py ${pkgdir}/usr/bin/${pkgname}
    chmod +x ${pkgdir}/usr/bin/${pkgname}
}
