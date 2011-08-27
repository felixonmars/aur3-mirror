# Maintainer: Duologic
pkgname=leocad-svn
pkgver=LATEST
pkgrel=3
pkgdesc="LeoCAD is a CAD program that uses bricks similar to those found in many toys (but they don't represent any particular brand)."
arch=('i686' 'x86_64')
conflicts=('leocad')
provides=('leocad')
packager=('Duologic')
url="http://leocad.org/"
license=('GPL')
depends=('zlib' 'libjpeg' 'libpng' 'gtk2' 'mesa')
makedepends=('unzip')
source=('http://leocad.googlecode.com/files/pieces-3506.zip' 'libpng12-to-libpng14-1.patch')
sha1sums=('29e3089362bcc691eac778f9a8ca156b1f32f615' 
		  '863421cfde7ea0b88f1cbe94f6112a28ef42d870')

_svntrunk=http://svn.gerf.org/leocad/trunk

build() {
  cd "$srcdir"
  svn co $_svntrunk
  msg "SVN checkout done or server timeout"
  msg "Applying patch for libpng14"
  patch -Np1 -i ../libpng12-to-libpng14-1.patch
  
  cd trunk/
  msg "Starting make..."
  make PREFIX="/usr" config
  make || return 1
  make DESTDIR=$pkgdir install || return 1
    
  cd "$pkgdir" 
  msg "Unpack pieces..."
  unzip -o ../pieces-3506.zip -d usr/share/leocad/
}
