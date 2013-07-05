# Maintainer: Clemens Brunner <clemens dot brunner at tugraz dot at>
pkgname=sigviewer
pkgver=0.5.2
pkgrel=3
pkgdesc="An application to view and annotate biosignals."
arch=('i686' 'x86_64')
url="http://sigviewer.sourceforge.net/"
license=('GPL')
depends=('qt4' 'zlib')
makedepends=('unzip')
source=($pkgname-$pkgver.tar.gz::http://sourceforge.net/projects/sigviewer/files/0.5.2/sigviewer-0.5.2-src.tar.gz/download libbiosig.tar.gz::http://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig4c%2B%2B-1.5.0.src.tar.gz/download biosig-1.5.0.patch sigviewer.desktop sigviewer128.png)
noextract=($pkgname-$pkgver.tar.gz)
md5sums=('09649fe2bf299b4d15c3866a693379f3' '2a3aad9368eb6fc494a6a27fd30f5ddd' '0429f1a99b68a10924e5db2aa749dcb2' '7d088320d5f901f256f5b1d6631e34ae' '238eeb7bb4b3e6d47b3d576aae3060ff')

build() {
  cd $srcdir
  patch biosig4c++-1.5.0/Makefile < biosig-1.5.0.patch
  cd biosig4c++-1.5.0
  make libbiosig.a
  cd ..

  tar xzf $pkgname-$pkgver.tar.gz
  mkdir -p $pkgname-$pkgver-src/external/lib/
  mkdir -p $pkgname-$pkgver-src/external/include/
  cp biosig4c++-1.5.0/libbiosig.a $pkgname-$pkgver-src/external/lib/
  cp biosig4c++-1.5.0/biosig.h $pkgname-$pkgver-src/external/include/
  cd $srcdir/$pkgname-$pkgver-src
  qmake-qt4
  make
}

package() {
  cd "$pkgdir"
  mkdir -p usr/bin
  mkdir -p usr/share/applications
  mkdir -p usr/share/pixmaps
  cp "$srcdir/$pkgname-$pkgver-src/bin/release/sigviewer" "$pkgdir/usr/bin"
  cp "$srcdir/sigviewer.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/sigviewer128.png" "$pkgdir/usr/share/pixmaps"
}