# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Biru Ionut <biru.ionut at gmail.com>
# Contributor: Andrea Fagiani <andfagiani {at} gmail {dot} com>
# Maintainer: Rainux Luo <rainux {at} gmail {dot} com>

# Installation order:  freetype2-ubuntu fontconfig-ubuntu libxft-ubuntu cairo-xcb-ubuntu
pkgname=cairo-xcb-ubuntu
pkgver=1.10.2
_ubver=1.10.2-2ubuntu2
pkgrel=5
pkgdesc="DEPRECATED: Please install cairo-ubuntu-xcb instead, this package will be deleted in the future."
arch=(i686 x86_64)
url="https://launchpad.net/ubuntu/natty/+source/cairo"
license=('LGPL' 'MPL')
depends=('libpng>=1.4.0' 'libxrender' 'fontconfig-ubuntu>=2.8.0' 'libxft-ubuntu' 'pixman>=0.16.6' 'xcb-util>=0.3.6')
makedepends=('pkgconfig')
provides=("cairo=$pkgver" "cairo-tee=$pkgver" "cairo-xcb=$pkgver")
conflicts=('cairo' 'cairo-cleartype' 'cairo-lcd' 'cairo-tee' 'cairo-xeffects')
options=('!libtool')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.gz
        http://archive.ubuntu.com/ubuntu/pool/main/c/cairo/cairo_$_ubver.debian.tar.gz
        cairo-respect-fontconfig.patch)

md5sums=('f101a9e88b783337b20b2e26dfd26d5f'
         'c28ce4e75bf13c2a10727b2af1385059'
         '79f7c141c49f3d65ab308cc706d50914')

build() {
  cd $srcdir/cairo-$pkgver

  for _f in $(cat $srcdir/debian/patches/series) ; do
    patch -Np1 -i $srcdir/debian/patches/$_f
  done

  patch -Np1 -i $srcdir/cairo-respect-fontconfig.patch

  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --enable-xcb --disable-static \
    --enable-tee
  make
}

package() {
  cd $srcdir/cairo-$pkgver

  make DESTDIR=$pkgdir install

  # Docs
  # Excluding debian/changelog temporarily
  install -d $pkgdir/usr/share/doc/cairo/
  install -m644 -t $pkgdir/usr/share/doc/cairo/ NEWS README
}
