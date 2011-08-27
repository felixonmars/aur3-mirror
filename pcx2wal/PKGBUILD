# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=pcx2wal
pkgver=2.3
pkgrel=1
pkgdesc="A tool to create .wal textures for Quake2"
arch=('i686' 'x86_64')
url="http://gamers.org/pub/idgames2/planetquake/ikq/"
license=('public domain')
makedepends=('make')
source=(http://www.gamers.org/pub/idgames2/planetquake/ikq/pcx2w23.zip)
md5sums=('0489e142618bb1f7bf71b19f03b459e6')

_subdir=linux

build() {
  cd "$srcdir/"

  rm -rf $_subdir && mkdir -p $_subdir

  for f in LINUX/*.C; do
    cp $f `echo $f | tr [:upper:] [:lower:]`
  done

  sed 's/^CFLAGS/#CFLAGS/g' LINUX/MAKEFILE > $_subdir/Makefile

  cd $_subdir && make
}

package() {
  cd "$srcdir/$_subdir"

  dest="$pkgdir/usr/bin"
  mkdir -p "$dest"
  install 16to8 colormap pcx2pal pcx2wal "$dest/"

  dest="$pkgdir/usr/share/pcx2wal"
  install -D ../COLORMAP.PCX "$dest/colormap.pcx"
  install -D ../PALETTE.PAL "$dest/palette.pal"
  install -D ../16TO8.DAT "$dest/16to8.dat"
}
