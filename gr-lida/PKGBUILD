# Maintainer: Mister.Bubbles
# Contributor: sidious/SiD <miste78 web.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=gr-lida
pkgver=0.10.0
pkgrel=4
pkgdesc="Front-End for DOSBox and ScummVM"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.gr-lida.org"
depends=('phonon' 'poppler-qt')
optdepends=('dosbox: for DOSBox support' 'scummvm: for ScummVM support')
source=("https://github.com/Monthy/gr-lida/archive/v$pkgver.tar.gz")
md5sums=('8c7515e0bf106641ef2ca0a1023d9e25')

build() {
   cd $srcdir/
   # Move into the Package Directory
   cd $pkgname-$pkgver
   # Compile GR-Lida
   qmake-qt4 gr-lida.pro
   make
}

package () {
   cd $srcdir
   cd $pkgname-$pkgver
   make INSTALL_ROOT="${pkgdir}" install
}

