# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>

pkgname=gap-math
pkgver=4.7.5
pkgrel=1
pkgdesc="A system for computational discrete algebra"
arch=('i686' 'x86_64')
url="http://www.gap-system.org/"
license=('GPL')
makedepends=('chrpath' 'rsync')
options=('!libtool' '!emptydirs' '!makeflags')
source=(http://www.gap-system.org/pub/gap/gap47/tar.bz2/gap4r7p5_2014_05_24-20_02.tar.bz2
        gap.sh)
sha256sums=('464eeb83380bb2f9b86b7a51289cb9a056879a5a037091d49b7fd4ecde5bb36b'
            'd90a6ac0610b0eea1657297e6d18a3bfcbdee8ca5c180079b55ae7c1af57cca2')

build() {
  cd "$srcdir/gap4r7"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/gap/"
  rsync -prv --exclude='*.exe' --exclude='*.dll' gap4r7/* "$pkgdir/opt/gap/"
  chrpath -d $(find "$pkgdir" ! -name '*.o' -exec file '{}' \;|grep ELF|cut -d: -f1)
  install -Dm755 gap.sh "$pkgdir/usr/bin/gap"
}

# vim:set ts=2 sw=2 et:
