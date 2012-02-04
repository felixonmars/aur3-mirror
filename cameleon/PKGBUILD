# Maintainer: TDY <tdy@gmx.com>

pkgname=cameleon
pkgver=0.2.1
pkgrel=1
pkgdesc="A universal file converter for various image/document/video/music formats"
arch=('i686' 'x86_64')
url="http://camaleon.sourceforge.net/index_en.html"
license=('GPL3')
depends=('gconf>=2.22.0' 'gstreamer0.10-base>=0.10.20' 'imagemagick>=6.4.0'
         'libgee>=0.1.3' 'poppler-glib>=0.8.0')
makedepends=('intltool>=0.35.0' 'pkgconfig>=0.9')
optdepends=('inkscape: convert SVG to PDF documents'
            'pdf2svg: convert PDF documents to SVG'
            'openoffice-base: convert office documents'
            'python: convert office documents')
install=$pkgname.install
source=(http://downloads.sourceforge.net/camaleon/$pkgname-$pkgver.tar.gz)
md5sums=('78b9c6195d1b546f3395cb81343619e5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/uvrir/pen/'  data/ui/cameleon.ui
  sed -i "10 s#=#=/usr/share/$pkgname/$pkgname.png#" data/$pkgname.desktop.in.in
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    "$pkgdir/etc/gconf/schemas/$pkgname.schemas" || return 1
  rm -rf "$pkgdir/etc"
}
