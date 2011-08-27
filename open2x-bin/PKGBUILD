# Contributor: Philipp Geyer <nistur@gmail.com>
pkgname=open2x-bin
pkgver=280
pkgrel=1
pkgdesc="The Open2x toolchain is the most up to date GP2X toolchain there is and is the last one which is actively maintained."
arch=('i686')
license=('GPL')
makedepends=('subversion' 'pkgconfig')
depends=('glibc>=2.4')
url="http://wiki.open2x.org"
source=('http://www.open2x.org/open2x/toolchains/arm-open2x-linux-apps-gcc-4.1.1-glibc-2.3.6_i686_linux.tar.bz2.zip' \
	'http://www.open2x.org/open2x/toolchains/open2x-libpack-20071903-gcc-4.1.1-glibc-2.3.6.tar.bz2.zip')
md5sums=('a4de8529c07109e1dc9b4aeef2f86645'
         '1e1accc319584d1f2558af822d1477f1')


build() {
	cd ${startdir}/src

	cp -R opt/ ${startdir}/pkg
	cp -R gcc-4.1.1-glibc-2.3.6 ${startdir}/pkg/opt/open2x
	chmod -R 777 ${startdir}/pkg/opt/open2x
}

