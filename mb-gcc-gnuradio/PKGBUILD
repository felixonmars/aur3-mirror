# Contributor: Szymon Jakubczak szym-at-mit-dot-edu
pkgname=mb-gcc-gnuradio
pkgver=4.1.1.gr2
pkgrel=1
pkgdesc="GCC toolchain for Microblaze"
arch=('i686' 'x86_64')
url="http://gnuradio.org"
license=('GPL')
depends=('lib32-glibc')
install=
options=('!strip')
source=(http://gnuradio.org/tools/mb-gcc-4.1.1.gr2.i386.tar.gz)
md5sums=('9541e7ddabde4410205cbe3bcf737f2b')

build() {
  # already built, just move it to opt
  mkdir ${pkgdir}/opt
  mv ${srcdir}/microblaze ${pkgdir}/opt/
}
