# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Henning Bekel <h.bekel@googlemail.com>

pkgname=sineshaper
pkgver=0.4.2
pkgrel=6
pkgdesc="A monophonic DSSI synth plugin."
arch=('i686' 'x86_64')
url="http://www.student.nada.kth.se/~d00-llu/music_dssi.php?lang=en"
license=('GPL')
depends=('libglademm' 'dssi')
source=("http://ll-plugins.sourceforge.net/release/$pkgname-$pkgver.tar.gz" gcc-4.3.patch)
md5sums=('952cb5bde0ae4fe2274859df5ed1ee61'
         '78c44bb7b1586917224f26aaa9545e9e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # gcc 4.3 patch
  patch -Np1 -i "$srcdir/${source[1]}"

  # DSO link fix
  LDFLAGS+="-lgthread-2.0" \
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # rename launcher
  mv "$pkgdir/usr/bin/$pkgname.sh" \
     "$pkgdir/usr/bin/$pkgname"
}
