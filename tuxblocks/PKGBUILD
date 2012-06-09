# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=tuxblocks
pkgver=1.0
pkgrel=3
pkgdesc="port of TI calculator game BlockDude"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tuxblocks/"
depends=(sdl_image sdl_ttf)
if test "$CARCH" == x86_64; then
  depends+=(lib32-sdl_image)
fi
license=('GPL')
source=(http://sourceforge.net/projects/$pkgname/files/TuxBlocks%20Source/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('46709dda4eab0680fdfed37b4a1cce85')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  awk -v f="$(find mk/autoconf -type f -iname \*m4 -printf '%p ')" '{
            if ($1=="$(wildcard")
              {print f}
            else
              {print $0}
            }' Makefile.am > /tmp/Makefile.am
  mv {/tmp,.}/Makefile.am
  cd data
  awk -v f1="$(find levels -type f -printf '%p ')" -v f2="$(find images -type f -printf '%p ')" '{
            if ($2=="levels/*)")
              {print f1,"\\"}
            else if ($2=="images/*)")
              {print f2,"\\"}
            else
              {print $0}
            }' Makefile.am > /tmp/Makefile.am
  mv {/tmp,.}/Makefile.am
  cd ..
  sed -i 's:DATADIR\":\"/usr/share/tuxblocks:' src/*.cpp
  sed -i 's:\(\"/usr/share/tuxblocks/\)\.\.:\1pixmaps:' src/*.cpp
  #sed -i 's:\(\"/usr/share/tuxblocks/\)\(images\\|font\):\1tuxblocks/\2:' src/*.cpp
  #sed -i 's:\(location\=\"\):\1tuxblocks/:' data/levels/levelsets.xml
  #sed -i 's:DATADIR, \(setlocation\|setname\):\"/usr/share/tuxblocks/tuxblocks\", \1:' src/*cpp
  sed -i 's:DATADIR:\"/usr/share/tuxblocks\":' src/*.cpp
  ./autogen.sh
  ./configure --prefix=/usr --datadir=/usr/share/tuxblocks --datarootdir=/usr/share/tuxblocks
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  mv "$pkgdir/usr/share/$pkgname/$pkgname/{*,../}"
  rm -r "$pkgdir/usr/share/$pkgname/$pkgname"
}

