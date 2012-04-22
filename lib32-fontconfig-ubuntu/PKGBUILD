# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Biru Ionut <biru.ionut at gmail.com>
# Maintainer: Andrea Fagiani <andfagiani {at} gmail {dot} com>

# Installation order:  freetype2-ubuntu fontconfig-ubuntu libxft-ubuntu cairo-ubuntu
_pkgbasename=fontconfig-ubuntu
pkgname=lib32-$_pkgbasename
pkgver=2.8.0
_pkgver=3ubuntu9
pkgrel=12
pkgdesc="A library for configuring and customizing font access, with Ubuntu's LCD rendering patches (32-bit)"
arch=(x86_64)
url="https://launchpad.net/ubuntu/precise/+source/fontconfig"
license=('custom')
depends=('lib32-bzip2' 'lib32-expat>=2.0.1' 'lib32-freetype2-ubuntu' $_pkgbasename)
makedepends=(gcc-multilib)
provides=("lib32-fontconfig=$pkgver")
conflicts=('lib32-fontconfig')
options=('!libtool')
source=(http://archive.ubuntu.com/ubuntu/pool/main/f/fontconfig/fontconfig_$pkgver.orig.tar.gz
        http://archive.ubuntu.com/ubuntu/pool/main/f/fontconfig/fontconfig_$pkgver-$_pkgver.diff.gz)

md5sums=('77e15a92006ddc2adbb06f840d591c0e'
         '9efc0828a5a38431d6a77f78383f8d7d')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $srcdir/fontconfig-$pkgver

  patch -Np1 -i ../fontconfig_$pkgver-$_pkgver.diff

  for _f in $(cat debian/patches/series) ; do
     patch -Np1 -i "debian/patches/$_f"
  done

  # Enable Position Independent Code for prelinking
  export CFLAGS="$CFLAGS -fPIC"
  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc --localstatedir=/var

  make
}

package() {
  cd $srcdir/fontconfig-$pkgver

  make DESTDIR=$pkgdir install

  rm -rf $pkgdir/usr/{include,share,bin}
  rm -rf $pkgdir/{etc,var}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename $pkgdir/usr/share/licenses/$pkgname
}
