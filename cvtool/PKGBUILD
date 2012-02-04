# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=cvtool
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line tool for processing images and data using GPU power"
arch=('i686' 'x86_64')
url="http://cvtool.sourceforge.net/"
license=('GPL')
depends=('glew' 'nvidia-utils')
optdepends=('cairo: for commandline tool')
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/cvtool/$pkgname-$pkgver.tar.bz2)
md5sums=('0950699320d6be7c1ddbc4045c959d9e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

  rm "$pkgdir"/usr/share/info/dir
}

# vim:set ts=2 sw=2 et:
