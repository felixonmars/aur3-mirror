# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Biru Ionut <biru.ionut at gmail.com>
# Maintainer: Andrea Fagiani <andfagiani {at} gmail {dot} com>

# Installation order:  freetype2-ubuntu fontconfig-ubuntu libxft-ubuntu cairo-ubuntu
_pkgbasename=libxft-ubuntu
pkgname=lib32-$_pkgbasename
pkgver=2.2.0
_ubver=2.2.0-3ubuntu2
pkgrel=4
pkgdesc="FreeType-based font drawing library for X, with Ubuntu's LCD rendering patches (32-bit)"
arch=(x86_64)
url="https://launchpad.net/ubuntu/precise/+source/xft"
license=('GPL')
depends=('lib32-fontconfig-ubuntu' 'lib32-freetype2-ubuntu' 'lib32-libxrender')
makedepends=('gcc-multilib')
provides=("lib32-libxft=$pkgver")
conflicts=('lib32-libxft')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://xorg.freedesktop.org/releases/individual/lib/libXft-$pkgver.tar.bz2
        http://archive.ubuntu.com/ubuntu/pool/main/x/xft/xft_$_ubver.diff.gz)

md5sums=('cce3c327258116493b753f157e0360c7'
         '7a977a1ac9418ee61ab3b39284199d80')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $srcdir/libXft-$pkgver

  patch -Np1 -i ../xft_$_ubver.diff

  for _f in $(cat debian/patches/series) ; do
    [[ $_f = "001_no_export_freetype.diff" ]] && continue
    patch -Np1 -i debian/patches/$_f
  done

  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package(){
  cd $srcdir/libXft-$pkgver
  make DESTDIR=$pkgdir install

  rm -rf $pkgdir/usr/{bin,include,share}
  mkdir -p $pkgdir/usr/share/licenses
  ln -s $_pkgbasename $pkgdir/usr/share/licenses/$pkgname
}
