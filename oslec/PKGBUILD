# Contributor:  _nalle <rickard.eriksson@gigabit.nu>
pkgname=oslec
pkgver=0.1
pkgrel=1
pkgdesc="An open source high performance line echo canceller"
url="http://www.rowetel.com/ucasterisk/oslec.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('asterisk' 'zaptel')
makedepends=()
source=(http://www.rowetel.com/ucasterisk/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('0ab5cba8b5f69dfbd7ed7f0dc5e92eda')
build() {
	cd ${startdir}/src/$pkgname-$pkgver
	make || return 1
	#Installing
	mkdir -p ${startdir}/pkg/lib/modules/`uname -r`/kernel/
	install -m 0644 ${startdir}/src/$pkgname-$pkgver/kernel/oslec.ko ${startdir}/pkg/lib/modules/`uname -r`/kernel/ 
}
