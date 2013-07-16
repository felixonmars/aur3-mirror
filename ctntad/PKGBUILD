# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=ctntad
pkgver=0.2.0
pkgrel=1
pkgdesc="Ceton InfiniTV Tunning Adapter Driver"
arch=('i686' 'x86_64')
url="http://cetoncorp.com/infinitv_support/linux_drivers/"
license=('GPL')
depends=('gupnp' 'libgusb' 'ceton_infinitv')
source=("http://cetoncorp.com/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('7929eb2e69868cc2969a95f8c93320bcf003c5276ef4e7c49a63b8df7f3855d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix undefined reference to symbol 'g_thread_init'
  sed -i "s|g_thread_init(NULL);|/*g_thread_init(NULL);*/|" src/main.c

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
