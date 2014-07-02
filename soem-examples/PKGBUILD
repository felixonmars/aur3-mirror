# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=soem-examples
pkgver=1.3.0
pkgrel=4
pkgdesc="Simple Open EtherCAT Master (SOEM) - an EtherCAT (Ethernet for Control Automation Technology) master library written in C (example binaries)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/soem.berlios/"
depends=('glibc' 'soem-lib')
license=('gpl2')
source=("http://downloads.sourceforge.net/project/soem.berlios/SOEM${pkgver}.tar.bz2"
        'osal.patch'
        'include.patch'
        'Makefile'
)
sha1sums=('0e58b8cf1876dc2e506e43a7c3327d76acecfe70'
          'ca261467d1034e0dd69a77e9c77d3e2170171cbb'
          '1458a31f603f6ac8ac35168bb2871c50998f01ae'
          '4efeaf1a6aae3298d7236ce4b5386a51580005f7')

prepare() {
  cd "${srcdir}/SOEM${pkgver}"
  patch -p0 -i "${srcdir}/osal.patch"
  patch -p1 -i "${srcdir}/include.patch"
}

build() {
  cd "${srcdir}/SOEM${pkgver}"
  make -f "$srcdir/Makefile"
}

package() {
  cd "${srcdir}/SOEM${pkgver}"
  make -f "$srcdir/Makefile" PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
