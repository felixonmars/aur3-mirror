# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Damir Perisa <damir@archlinux.org>

pkgname=glabels
pkgver=3.0.0
pkgrel=1
pkgdesc="Creating labels and business cards the very easy way"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://glabels.sourceforge.net/"
depends=('dconf' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'librsvg' 'libxml2' 'shared-mime-info')
makedepends=('pkgconfig' 'perlxml' 'gnome-doc-utils' 'intltool')
optdepends=('barcode' 'zint')
options=('!libtool')
install=glabels.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/3.0/$pkgname-$pkgver.tar.bz2)
sha1sums=('74f5a3fb09a12ef15827c1eef6f13b82c27a621e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
