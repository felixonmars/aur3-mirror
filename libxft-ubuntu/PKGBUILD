# Maintainer: Tevin Zhang <mail2tevin {at} gmail {dot} com>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Biru Ionut <biru.ionut at gmail.com>
# Contributor: Andrea Fagiani <andfagiani {at} gmail {dot} com>

# Installation order:  freetype2-ubuntu fontconfig-ubuntu libxft-ubuntu cairo-ubuntu
pkgname=libxft-ubuntu
pkgver=2.3.1
_ubver=2.3.1-1
pkgrel=1
pkgdesc="FreeType-based font drawing library for X, with Ubuntu's LCD rendering patches"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/precise/+source/xft"
license=('GPL')
depends=('fontconfig-ubuntu>=2.6.0' 'freetype2-ubuntu' 'libxrender' 'sh')
conflicts=('libxft' 'freetype2-cleartype' 'freetype2-lcd')
provides=("libxft=$pkgver")
makedepends=('pkgconfig')
options=('!libtool')
source=(http://xorg.freedesktop.org/releases/individual/lib/libXft-$pkgver.tar.bz2
        http://archive.ubuntu.com/ubuntu/pool/main/x/xft/xft_$_ubver.diff.gz)

md5sums=('78d64dece560c9e8699199f3faa521c0'
         'b7044127ec01c2de70ca5fd733a850bf')

build() {
  cd $srcdir/libXft-$pkgver

  patch -Np1 -i ../xft_$_ubver.diff

  for _f in $(cat debian/patches/series) ; do
    [[ $_f = "001_no_export_freetype.diff" ]] && continue
    patch -Np1 -i debian/patches/$_f
  done

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static

  make
  make DESTDIR=$pkgdir install

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

}
