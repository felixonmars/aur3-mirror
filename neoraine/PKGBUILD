# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=neoraine
pkgver=1.4.2
_gitver=70075ab
pkgrel=1
pkgdesc="A NeoGeo CD emulator based on Raine"
url="http://rainemu.swishparty.co.uk"
license=('unknown')
arch=('i686' 'x86_64')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-sdl_ttf' 'lib32-sdl_image' 'lib32-sdl_sound' 'lib32-muparser')
  makedepends=('nasm' 'gcc-multilib')
else
  depends=('sdl_ttf' 'sdl_image' 'sdl_sound' 'muparser')
  makedepends=('nasm')
fi
source=("raine-$pkgver.tar.gz"::"http://rainemu.swishparty.co.uk/cgi-bin/gitweb.cgi?p=raine;a=snapshot;h=70075abd4c6a2217d1dfe96b267056eb2a677e9e;sf=tgz"
        "http://rainemu.swishparty.co.uk/html/archive/debian/dists/unstable/main/binary-amd64/raine_0.61.1_amd64.deb")
md5sums=('f75bf83cf9531cac7bbdf2d82128f968'
         '1e14c287f20aba4298458593db1063bf')


build() {
  cd "$srcdir"
  mkdir -p raine-bin
  bsdtar xf data.tar.gz -C raine-bin

  cd "raine-$_gitver"

  # fix system directories in Makefile for the install target
  sed -e 's|\$(prefix)\/games|\$(prefix)\/bin|' \
      -e 's|INSTALL = @install|INSTALL = install|' \
      -e 's|rainedata = $(sharedir)/raine|rainedata = $(sharedir)/neoraine|' \
      -i makefile

  # -O3 optimizations cause segfaults, use -O2 instead
  sed -e 's|CFLAGS = -O3|CFLAGS = -O2|' -i makefile

  # NeoRaine share path conflicts with Raine, define another directory
  sed -e 's|"/usr/share/games/raine/"|"/usr/share/games/neoraine/"|' \
      -i source/raine.c

  make NEO=1
}

package() {
  cd "$srcdir/raine-$_gitver"
  make NEO=1 DESTDIR="$pkgdir" install

  # install fonts and bitmaps from raine's deb package
  install -m644 "$srcdir"/raine-bin/usr/share/games/raine/bitmaps/{cursor.png,raine_logo.png} "$pkgdir/usr/share/games/$pkgname/bitmaps"
  install -m644 "$srcdir"/raine-bin/usr/share/games/raine/fonts/{Vera.ttf,VeraMono.ttf,font6x8.bin} "$pkgdir/usr/share/games/$pkgname/fonts"
}
