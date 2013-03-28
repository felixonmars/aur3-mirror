pkgname=gencfsm
pkgver=1.6.9
pkgrel=1
pkgdesc="An easy to use manager and mounter for encfs stashes"
arch=('i686', 'x86_64')
license=('GPL')
depends=('libappindicator3')
makedepends=()
install=$pkgname.install
url="https://launchpad.net/gencfsm"
source=(https://launchpad.net/gencfsm/trunk/1.6/+download/gencfsm-1.6.9.tar.gz
    ${pkgname}.patch
    )

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p3 < ../${pkgname}.patch
  mkdir m4

  ./autogen.sh --verbose
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

sha256sums=('14a7f49db80ea9d05bd5fe659b490b824dad03e7688a5e1331ca0405c583cd45'
            '8776323f305ea7354626342e58b7c20b65aa7b7947d1cfc414126feb95e0e142')
