# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=miroslav
pkgver=beta_3
pkgrel=1
pkgdesc="a Client/Server Chat System like IRC, written in C++ and using Qt. "
arch=(i686)
url="http://sourceforge.net/projects/miroslav/"
license=('GPL')
depends=()
makedepends=('make' 'unzip')
source=(http://downloads.sourceforge.net/sourceforge/miroslav/Miroslav_Beta_3_src.zip)
md5sums=('c2b8d9a3fb1db9d598bb81e615c80f8a') 

build() {
  cd "$srcdir/"

  qmake || return 1
  make || return 1
  make bindir="$pkgdir/usr/bin" DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
