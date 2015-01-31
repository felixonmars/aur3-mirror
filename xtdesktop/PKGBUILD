# Contributor: Josh Harding <theamigo@gmail.com>
pkgname=xtdesktop
pkgver=0.7b
pkgrel=2
pkgdesc="A light-weight desktop icon manager"
arch=('i686' 'x86_64')
url="http://garuda.newmail.ru/xtdesk_e.dhtml"
license=('GPL')
depends=(imlib libxaw gcc-libs)
source=('patchfile.patch' "http://garuda.newmail.ru/$pkgname-$pkgver.tgz")
md5sums=('d0dca7e801359fa0b724600b81facae7' '3ddb2535ffedf7b3c9f145d720a51de9')

build() {
  cd "$pkgname-$pkgver"
  patch -N -i ../patchfile.patch || return 1
  make || return 1
}

package() {
  pushd "$srcdir/$pkgname-$pkgver"
  DOC="$pkgdir/usr/share/doc/$pkgname"
  mkdir -p $pkgdir/usr/bin "$DOC"
  install -m755 -t "$pkgdir/usr/bin/" xtdesk || return 1
  install -m644 -t "$DOC" xtdeskrc || return 1
  cp README.eng "$DOC/README" || return 1
  cp -r xtdesktop "$DOC" || return 1
  popd
}
