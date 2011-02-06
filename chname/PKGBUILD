# Contributor: Maciej Sitarz <macieks@freesco.pl>

pkgname=chname
pkgver=1.0
pkgrel=1
pkgdesc="Run a command in a utsname namespace with a new hostname."
arch=('i686' 'x86_64')
url="http://code.google.com/p/chname"
license=('GPL')
depends=('glibc')
source=("http://chname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('63ac65ae3ded2e2bcfcf62dd5387462a')

build() {
 cd ${srcdir}/${pkgname}-${pkgver}
 
 make || return 1
 strip ${pkgname} || return 1

 install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
}
