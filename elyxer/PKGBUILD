# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=elyxer  
pkgver=1.2.3
pkgrel=1
pkgdesc="eLyXer is a LyX to HTML converter with a clear focus on flexibility and elegant output"
url="http://elyxer.nongnu.org/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python2>=2.3.4')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://download.savannah.gnu.org/releases/elyxer/$pkgname-$pkgver.tar.gz")
md5sums=('b745eed972ce31d391579793ec5829f6')
build() {
  cd $startdir/src/$pkgname-$pkgver

  # From http://allanmcrae.com/2010/10/big-python-transition-in-arch-linux/
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find . -name '*.py')

  # Might not be needed, but can't hurt:
  sed -i -e "s|self.writer.writeline('#! /usr/bin/env python')|self.writer.writeline('#! /usr/bin/env python2')|" \
    src/elyxer/conf/fileconfig.py

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
