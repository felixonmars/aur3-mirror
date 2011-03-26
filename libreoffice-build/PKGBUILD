# Contributor: Vamp898 <vamp898@web.de>

pkgname=libreoffice-build
pkgver=3.2.99.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="LibreOffice is a productivity suite that is compatible with other major office suites, and available on a variety of platforms."
url="http://www.documentfoundation.org/"
license="LGPL"
conflicts=('openoffice-base' 'go-openoffice' 'go-oo-bin-base')
depends=('gtk2' 'fontconfig' 'libxtst' 'nss' 'libxaw' 'python')
makedepends=('gcc' 'git' 'rsync')
source=(http://download.documentfoundation.org/libreoffice/src/$pkgname-$pkgver.tar.gz)

build() {
	cd ${srcdir}
	cd $pkgname-$pkgver
	./autogen.sh --with-distro=LibreOfficeLinux --with-num-cpus=2
	./download
	make
	bin/ooinstall -l ${pkgdir}
}
md5sums=('0a7fbe8193f9334b068c4fef9a958fc4')
