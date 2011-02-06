pkgname=reveal
pkgver=1.0
pkgrel=1
pkgdesc="An easy to use, cross platform EXIF metadata viewer with limited editing capabilities."
url="http://www.kde-apps.org/content/show.php?content=30685"
license="GPL"
depends=(libjpeg exiv2-svn qt)
makedepends=(libjpeg exiv2-svn qt)
conflicts=()
replaces=()
backup=()
install=
source=(http://dl.sourceforge.net/albumshaper/reveal_$pkgver.tar.bz2 Reveal.pro.patch)
md5sums=('2e30ffbec5e8e1b97dc7d00ee3263be3' 'c3b4a464781b1afa1403cafd8aa7db9a')

build() {
  cd $startdir/src/reveal_${pkgver}_src
  patch -Np0 < ../Reveal.pro.patch
  qmake
  make || return 1
# make DESTDIR=$startdir/pkg install
  DESTDIR=$startdir/pkg
  mkdir -p $DESTDIR/usr/{bin,share/reveal/images}
  cp -f "bin/reveal.bin" "$DESTDIR/usr/bin/reveal.bin"
  strip "$DESTDIR/usr/bin/reveal.bin"
  cp -f -r "bin/images/exifIcons" "$DESTDIR/usr/share/reveal/images/"
  cp -f "bin/images/revealImages/reveal.png" "$DESTDIR/usr/share/reveal/images/"
  cp -f bin/reveal $DESTDIR/usr/bin/reveal;
}
