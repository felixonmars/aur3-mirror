pkgname=ltwheelconf-git
pkgver=20131029
pkgrel=1
pkgdesc="Tool for changing various settings of the Logitech racing wheels"
arch=("i686" "x86_64")
url="https://github.com/thk/LTWheelConf"
license=('GPL')
depends=('libusb')
source=("$pkgname"::'git+https://github.com/thk/LTWheelConf.git')
md5sums=('SKIP')


pkgver() {
	cd "$pkgname"
	# Use the tag of the last commit
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"

}

build() {
	cd "$pkgname"
	make
}


package() {
	cd "$pkgname"
	mkdir -p ${pkgdir}/usr/bin
	install -D -m755 ./ltwheelconf ${pkgdir}/usr/bin/ltwheelconf
}
