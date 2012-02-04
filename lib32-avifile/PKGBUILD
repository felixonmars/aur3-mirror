# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk
# Maintainer: JD Steffen <jd@steffennet.org>

_pkgbase=avifile
pkgname=lib32-$_pkgbase
pkgver=0.7.45
pkgrel=1
pkgdesc="A library that allows you to read and write compressed AVI files (32-bit)"
arch=('x86_64')
depends=('lib32-sdl' 'lib32-freetype2' 'lib32-libpng' 'lib32-libjpeg' \
         'lib32-libvorbis' 'lib32-xvidcore' 'lib32-libxxf86dga' 'lib32-libxi' 'lib32-libxv')
makedepends=('lame')
url="http://avifile.sourceforge.net"
license=('GPL')
source=("http://downloads.sourceforge.net/sourceforge/avifile/$_pkgbase-0.7-$pkgver.tar.bz2"
	'gcc.patch')
md5sums=('7da94802f120d1b69e04a13170dcd21d'
         '588c3ce7bdebc1244f46ba56d8ef8a42')

build() {
  cd $_pkgbase-0.7-$pkgver

  patch -Np1 <../gcc.patch

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

 ./configure \
    --prefix=/usr \
    --libdir=$pkgdir/usr/lib32 \
    --without-qt \
    --host=x86_64-unknown-linux-gnu \
    --target=i686-unknown-linux-gnu

  make
}

package() {
  cd $_pkgbase-0.7-$pkgver
   
  make prefix=$pkgdir/usr install

  rm -rf "${pkgdir}"/usr/{include,share,bin,man}
  find $pkgdir -name '*.la' -exec rm {} \;
}
