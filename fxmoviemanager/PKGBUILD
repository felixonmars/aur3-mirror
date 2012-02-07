# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=fxmm
pkgname=fxmoviemanager
pkgver=5.6
pkgrel=1
pkgdesc="A filemanager written to help managing Movie files and Video clips."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/fxmoviemanager/"
license=('GPL')
depends=('ffmpegthumbnailer' 'fox-devel' 'clamav'
         'desktop-file-utils' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/${_name}_${pkgver}_release/${_name}_$pkgver.tar.bz2")
md5sums=('f807a15437eb742cda839e1585e5b31d')

build() {
  cd "$srcdir/${_name}_$pkgver"

  # fix pixmaps path
  sed -i "s|\(/local\)*\(/share\)\(/pixmaps\)|\2/$pkgname\3|g" \
    `grep -rl /share/pixmaps .`

  # use reswrap-1.7
  find . -name "Makefile*" -exec \
    sed -i 's/\(reswrap\).*/\1-1.7/' "{}" \;

  ./configure --prefix=/usr
  make

  # build fxarchive
  cd fxarchive && make

  # build fxscanvirus
  cd ../fxscanvirus && make
}

package() {
  cd "$srcdir/${_name}_$pkgver"

  make DESTDIR="$pkgdir/" install

  # install fxarchive
  cd fxarchive && make DESTDIR="$pkgdir/" install

  # install fxscanvirus
  cd ../fxscanvirus && make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
