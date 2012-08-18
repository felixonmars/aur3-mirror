pkgname=slarchive
pkgver=2.1
pkgrel=1
pkgdesc="A SeedLink client that writes all received data to the local disk in user defined directory and file structures."
arch=('i686' 'x86_64')
url="http://www.iris.edu/data/dmc-seedlink.htm"
license=('GPL' 'LGPL')
depends=('glibc')
source=(http://www.iris.edu/pub/programs/SeedLink/$pkgname-$pkgver.tar.gz)
md5sums=('dec3d73de9d2f0b3e4233ea1a1e94093')
sha256sums=('f16deff4f9468192f08fee203fd77c828a51a7382d0f7f1294258da5cfe51542')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 doc/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
