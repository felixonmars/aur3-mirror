# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=swami
pkgver=2.0.0
pkgrel=2
pkgdesc="A collection of free software for editing and sharing MIDI instruments and sounds"
arch=('i686' 'x86_64')
url="http://swami.resonance.org/trac"
license=('GPL')
depends=('audiofile' 'libgnomecanvas' 'libinstpatch' 'librsvg' 'fluidsynth'
         'fftw' 'gtksourceview2' 'hicolor-icon-theme' 'desktop-file-utils')
options=('!libtool')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('849b40e4a97c4f52faf069006358dd4f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fPIC fix for x86_64
  [ "$CARCH" = 'x86_64' ] && \
    export CFLAGS="$CFLAGS -fPIC"

  # set python2
  export PYTHON=python2

  # python2 locate path fix
  sed -i "s/echo\( \$PYTHON\)/which\1/g" configure

  # build against gtksourceview-2.0
  sed -i "s/\(gtksourceview-\)1.0/\12.0/g" configure

  sed -e "s/\(anguage\)s/\1/" \
      -e "s/_from_mime_type//" \
      -e "s/light/&_syntax/" \
      -i src/swamigui/SwamiguiPythonView.c

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
