# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=ffmpegyag-hg
pkgver=261.e188f036805d
pkgrel=1
pkgdesc="An advanced GUI for the popular FFmpeg audio/video encoding tool."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ffmpegyag/"
license=('MIT')
depends=('ffmpeg' 'wxgtk2.8')
makedepends=('mercurial')
install=ffmpegyag.install
source=('hg+http://hg.code.sf.net/p/ffmpegyag/code')
md5sums=('SKIP')

prepare() {
  cd $srcdir/code
  ./configure --prefix=/usr

  # Use wxGTK2.8
  sed -i 's|3.0|2.8|g' Makefile
  sed -i 's|unicode|unicode-release|' Makefile
  sed -i 's|-lwx_gtk2u_webview-2.8||' Makefile
}

build() {
  cd $srcdir/code
  make
}

package() {
  cd $srcdir/code
  make DESTDIR=$pkgdir install
  
  # License
  mkdir -p $pkgdir/usr/share/licenses
  mv $pkgdir/usr/share/doc/ffmpegyag $pkgdir/usr/share/licenses
  
  # Delete Debian stuff
  rm -rf $pkgdir/usr/share/{doc,menu}
}

pkgver() {
  cd $srcdir/code
  echo $(hg identify -n).$(hg identify -i)
}