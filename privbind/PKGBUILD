# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=privbind
pkgver=1.2
pkgrel=1
pkgdesc="Allow unprivileged apps to bind to a privileged port"
arch=('any')
url="http://sourceforge.net/projects/privbind"
license=('GPL2')
source=("http://downloads.sf.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('07e06409bf8f5f0bc1e64a9ad3ea8f98')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -D /usr/share/licenses/common/${license}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
