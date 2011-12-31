# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=bsl
pkgver=0.6.0
pkgrel=1
pkgdesc="Buzztard song loader"
arch=('i686' 'x86_64')
url="http://www.buzztard.org"
license=('LGPL')
depends=('buzztard>=0.6.0')
options=('!libtool')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/buzztard/$pkgname-$pkgver.tar.gz")
md5sums=('5ee01f8e423c1c1716d39d2cc2e03672')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Deleting unneeded files
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  find "$pkgdir/usr/share/mime" -maxdepth 1 -type f -exec rm {} \;
}
