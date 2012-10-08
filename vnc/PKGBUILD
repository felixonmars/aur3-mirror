# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tanguy Alexis < alexis dot tanguy at yahoo dot fr >

pkgname=vnc
pkgver=4.1.3
pkgrel=2
pkgdesc='The original open-source cross-platform remote control solution (without xvnc).'
arch=('i686' 'x86_64')
url='http://www.realvnc.com'
license=('GPL2')
depends=('gcc-libs' 'libxtst' 'libsm')
conflicts=('tightvnc')
source=("${pkgname}-${pkgver}.tar.gz::http://www.realvnc.com/download/binary/785"
        'vnc-gcc43.diff')
md5sums=('a119f3c75ad2767c0588260e2abe39be'
         '6cda2734352ce274cffcf304dc8a49b3')

build() {
  cd $pkgname-${pkgver//./_}-unixsrc

  patch -p1 < ../vnc-gcc43.diff || return 1

  cd unix

  ./configure --prefix=/usr || return 1

  make || return 1 # making vnc (without Xvnc)
}

package() {
  cd $pkgname-${pkgver//./_}-unixsrc/unix

  install -d "$pkgdir"/usr/{bin,share/man/man1}

  ./vncinstall "$pkgdir/usr/bin" "$pkgdir/usr/share/man"
}