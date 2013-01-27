# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=buzztard
pkgver=0.7.0
pkgrel=1
pkgdesc="A modular, free, open source music studio that is conceptually based on Buzz."
arch=('i686' 'x86_64')
url="http://www.buzztard.org"
license=('LGPL')
depends=('gst-buzztard>=0.7.0' 'libgsf' 'libgnomecanvas' 'gstreamer0.10-base' 'gconf'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'gtk-doc')
options=('!libtool' '!emptydirs' '!strip')
#options+=('!strip')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/buzztard/$pkgname-$pkgver.tar.gz"
        "$pkgname-null-ptr.patch")
md5sums=('4afed3301af35dd87ea15aa3d94b8bbb'
         '359799495a7bbe23510b7c17bddd85bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # null pointer patch
  patch -p1 -i ../${source[1]}

  ./configure --prefix=/usr \
              --enable-static=no \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
#              --enable-debug \
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Deleting unneeded files
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  find "$pkgdir/usr/share/mime" -maxdepth 1 -type f -exec rm {} \;
}
