#Contributor: Nicolás Reynolds <nicolas.reynolds@gmail.com>

pkgname=workaholic
pkgver=0.2.0
pkgrel=1
pkgdesc='A python program to take a break once in a while during work'
arch=('i686' 'x86_64')
url="http://mundogeek.net/workaholic/"
license="GPL"
depends=('python-pygame')
source=(https://edge.launchpad.net/%7Ezootropo/+archive/+files/${pkgname}_${pkgver}-${pkgrel}.tar.gz)
md5sums=('9bb0d9316ccb3084d5700538c0d4d8cc')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	make DESTDIR=${startdir}/pkg install
}
