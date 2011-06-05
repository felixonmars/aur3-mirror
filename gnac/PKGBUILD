# Maintainer:  TDY <tdy@gmx.com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=gnac
pkgver=0.2.3
pkgrel=1
pkgdesc="GNome Audio Converter"
arch=('i686' 'x86_64')
url="http://gnac.sourceforge.net/"
license=('GPL3')
depends=('gstreamer0.10-base-plugins>=0.7.2' 'libgnomeui>=2.0.0')
makedepends=('gnome-doc-utils>=0.17.2' 'gnome-media>=2.0.0' 'intltool>=0.35.0' 'pkgconfig>=0.9')
optdepends=('gstreamer0.10-bad-plugins: AAC encoding support (requires rebuild)'
            'gstreamer0.10-ugly-plugins: MP3 encoding support (requires rebuild)')
install=gnac.install
source=(http://downloads.sourceforge.net/gnac/gnac-$pkgver.tar.bz2
        gnac-0.2.3-libnotify7.diff)
md5sums=('3268bc62e943890670c408db7ba33d76'
         '13c2dcf2ac6039e31395c9756a7df945')

build() {
  cd "$srcdir/gnac-$pkgver"
  sed -i 's/install-schemaDATA$//' data/Makefile.in
  sed -i '2 c\Version=1.0' data/gnac.desktop.in.in
  patch -Np1 -i ../gnac-$pkgver-libnotify7.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/gnac-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/gnac.schemas" \
    data/gnac.schemas
}
