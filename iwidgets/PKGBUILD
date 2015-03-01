# Maintainer: gustawho <gustawho[at]gmail[dot]com>
# Contributor: lolilolicon <lolilolicon#gmail#com>
# Contributor: David Valentim Dias <dvdscripter@gmail.com>

pkgname=iwidgets
pkgver=4.0.1
pkgrel=6
pkgdesc="An object-oriented mega-widget set which extends Tcl/Tk"
url="http://incrtcl.sourceforge.net/iwidgets/"
license="custom"
arch=('i686' 'x86_64')
depends=('itk>=3.4')
makedepends=(autoconf)
source=(http://downloads.sourceforge.net/sourceforge/incrtcl/$pkgname$pkgver.tar.gz
        $pkgname$pkgver.patch)
md5sums=('0e9c140e81ea6015b56130127c7deb03'
         'bd2a2fed0c94f4770b779e618db6d24b')

build() {
  cd "$srcdir/$pkgname$pkgver"
  patch -Nup0 < ../$pkgname$pkgver.patch
  autoreconf
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-itcl=/usr/lib/itcl3.4 --with-itk=/usr/lib/itk3.4
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname$pkgver/license.terms" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Fix broken symlink.
  ln -sf -T $pkgname$pkgver "$pkgdir/usr/lib/$pkgname"

  # Fix broken mandir.
  mv "$pkgdir"/usr/{,share/}man
}
