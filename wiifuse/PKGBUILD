# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>

pkgname=wiifuse
_pkgname=Wiifuse
pkgver=0.2.0
pkgrel=1
pkgdesc="Allows you to mount a Gamecube or Wii DVD disc image as a read-only part of the file system on you computer. This allows users to browse the directory structure and read the files within."
arch=(i686 x86_64)
url="http://wiibrew.org/wiki/Wiifuse"
license=('GPL')
depends=('openssl' 'fuse>=2.6')
makedepends=('make')
optdepends=("dolphin-emu: for running the disc on your computer")
source=(http://wiibrew.org/w/images/0/04/$_pkgname-$pkgver.tgz)
md5sums=('fa8882f07ccf02ec9278bec0195cb77c')

build(){
	cd ${srcdir}/${pkgname}-${pkgver}
	make || return 1
	
	mkdir -p ${pkgdir}/usr/bin
	cp wiifuse ${pkgdir}/usr/bin
}
