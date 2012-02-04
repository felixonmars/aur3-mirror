# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=wine-dib
pkgver=1.3.11
pkgrel=1
pkgdesc="Wine with DIB engine patch"
arch=('i686' 'x86_64')
url="http://www.winehq.org/"
license=('GPL')
depends=('fontconfig' 'mesa' 'libxcursor' 'libxrandr' 'libxdamage' 'libxxf86dga' 'alsa-lib')
optdepends=('giflib' 'libpng' 'libldap' 'lcms' 'libxml2' 'mpg123' 'openal' 'jack' 'libcups' 'gnutls' 'v4l-utils')
conflicts=('wine')
provides=('wine')
source=(http://www.ibiblio.org/pub/linux/system/emulators/wine/wine-$pkgver.tar.bz2
        dibeng-max.zip::http://bugs.winehq.org/attachment.cgi?id=31885
        dib-mask.patch::http://bugs.winehq.org/attachment.cgi?id=27313
        winex11-argb4444.patch::http://bugs.winehq.org/attachment.cgi?id=27311
        dib-engine-0002-initial-pass-throug.patch.patch)
md5sums=('c7ddaa2b8a408839475784c7033ba809'
         '97159d77631da13952fe87e846cf1f3b'
         '6754a858a7ce4cdb715b34a018365479'
         'd685211bf9d7857ad8070524f8f6045e'
         '34b06b93460afb686529b67258f252dd')

build() {
  cd "$srcdir"
  patch -Np1 -i "dib-engine-0002-initial-pass-throug.patch.patch"
  cd "wine-$pkgver"
  patch -Np1 -i "$srcdir/dib-engine-0001-hook-the-engine-bet.patch"
  patch -Np1 -i "$srcdir/dib-engine-0002-initial-pass-throug.patch"
  patch -Np1 -i "$srcdir/dib-engine-0003-fork-ddb-dib-behavi.patch"
  patch -Np1 -i "$srcdir/dib-engine-0004-implement-most-engi.patch"
  patch -Np1 -i "$srcdir/dib-engine-0005-implement-alphablen.patch"
  patch -Np1 -i "$srcdir/dib-engine-0006-add-clipping-on-xxx.patch"
  patch -Np1 -i "$srcdir/dib-engine-0007-implement-polygon.patch"
  patch -Np1 -i "$srcdir/dib-engine-0008-fixes-clipping-text.patch"
  patch -Np1 -i "$srcdir/dib-engine-0009-fixes-against-wine-.patch"
  patch -Np1 -i "$srcdir/dib-engine-0010-introduction-of-bit.patch"
  patch -Np1 -i "$srcdir/dib-engine-0011-fix-mapmodes-for-xx.patch"
  patch -Np1 -i "$srcdir/dib-engine-0012-fix-color-in-antial.patch"
  patch -Np1 -i "$srcdir/dib-engine-0013-dont-use-now-missin.patch"
  patch -Np1 -i "$srcdir/dib-engine-0014-fix-vertically-mirr.patch"
  #patch -Np1 -i "$srcdir/dib-engine-0015-update-winedib-drv.patch"
  patch -Np1 -i "$srcdir/dib-engine-0016-quick-fix-for-wine-1-2-rc2.patch"
  patch -Np1 -i "$srcdir/dib-engine-0017-fix-alphablend-bug.patch"
  patch -Np1 -i "$srcdir/dib-mask.patch"
  patch -Np1 -i "$srcdir/winex11-argb4444.patch"
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
    cd "$srcdir/wine-$pkgver"
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
