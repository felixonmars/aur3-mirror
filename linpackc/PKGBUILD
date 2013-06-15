# Contributor: Cornholio <vigo.the.unholy.carpathian@gmail.com>
pkgname=linpackc
pkgver=2.25.94
pkgrel=1
pkgdesc='C port of linpack. Compatible with ARM'
arch=('any')
conflicts='linpack'
provides='linpack'
requires={'glibc'}
license=('GPL')
url="http://www.netlib.org/benchmark/"
source=("http://www.netlib.org/benchmark/linpackc.new")
sha256sums=('a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e')

build() {
	cd ${srcdir}
	mv linpackc.new linpack.c
	gcc -O3 -mfloat-abi=hard -mfpu=vfp linpack.c -o linpack
}

package() {

	install -Dm755 ${srcdir}/linpack ${pkgdir}/usr/bin/linpack

}
