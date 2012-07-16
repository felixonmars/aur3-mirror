# Maintainer: Justin Wilcox <nat1192@gmail.com>
# Contributor: Henning Bekel <h dot bekel at googlemail dot com>
# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>

pkgname=gosu
pkgver=0.7.44
pkgrel=1
pkgdesc="2D game development library for the C++ programming language."
arch=('i686' 'x86_64')
url="http://libgosu.org/"
license="MIT"
depends=('sdl_ttf' 'pango' 'libgl' 'libxinerama' 'openal' 'libvorbis' 'libsndfile' 'freeimage')
source=("http://www.libgosu.org/downloads/gosu-linux-$pkgver.tar.gz")
md5sums=('acd6ae89c4b0e0112b0ef3bd0eb97ed3')

# Work around for broken archive
noextract=("gosu-linux-$pkgver.tar.gz")

build() {
  # Manual extraction because bsdtar won't accept the file for some reason
  cd "${srcdir}"
  tar -xzf "gosu-linux-$pkgver.tar.gz"

  cd "${srcdir}/${pkgname}/linux"
  ./configure --prefix=/usr
  make
}

package () {
  install -D -m644 $srcdir/$pkgname/lib/libgosu.a $pkgdir/usr/lib/libgosu.a
  install -D -m755 $srcdir/$pkgname/lib/libgosu.so $pkgdir/usr/lib/libgosu.so
  install -D -m755 $srcdir/$pkgname/bin/gosu-config $pkgdir/usr/bin/gosu-config

  install -d $pkgdir/usr/include/Gosu
  install -D -m644 $srcdir/$pkgname/Gosu/*.hpp $pkgdir/usr/include/Gosu

  install -D -m 644 $srcdir/$pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
