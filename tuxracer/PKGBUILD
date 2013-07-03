# Maintainer: Christoph Vigano <mail@cvigano.de>

pkgname=tuxracer
pkgver=0.61
pkgrel=10
pkgdesc="Take on the role of Tux as he races down steep, snow-covered mountains."
arch=('i686' 'x86_64')
url="http://tuxracer.sourceforge.net/"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'tcl>=8.5.0' 'glibc' 'audiofile' 'libogg' 'libvorbis' 'libxi' 'libxmu' 'mesa' 'libgl')
source=(http://downloads.sourceforge.net/tuxracer/$pkgname-$pkgver.tar.gz
        http://downloads.sourceforge.net/tuxracer/tuxracer-data-0.61.tar.gz 
        $pkgname-datadir.patch
        $pkgname-pasting.patch
        $pkgname.desktop
        $pkgname.png)
md5sums=('206e8197ceaf0f00b25d4e2b4156e563'
         'aef877fee9e1a56483ff01fbdfb1e4b3'
         'a96a26d6e22b91b5f3f3b0fb29cef589'
         '9cab49d96fb17aff1ab67d755885242f'
         'c23baf2f2bad6286b1d3c6e4b9bd457d'
         'd62cbbea6264826ad10ee1991e05f62f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
 patch -Np1 -i "$srcdir/$pkgname-datadir.patch"
 patch -Np1 -i "$srcdir/$pkgname-pasting.patch"

 mv configure.in configure.ac

  sed -i -e "s/\(have_glext_h=no\)/\1, \[\#include <GL\/gl.h>\]/" configure.ac

  autoreconf -if
  CPPFLAGS="$CXXFLAGS -DGLX_GLXEXT_LEGACY" \
    ./configure --prefix=/usr --with-tcl-lib-name=tcl8.6 --with-tcl-header=tcl.h
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="${pkgdir}/usr" install
  
  # install data
  install -dm755 "${pkgdir}/usr/share/tuxracer"
  mv $srcdir/$pkgname-data-$pkgver/* "${pkgdir}/usr/share/tuxracer"
  find "${pkgdir}/usr/share/tuxracer" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/share/tuxracer" -type d -exec chmod 755 {} \;

  install -Dm644 "$srcdir/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
}
