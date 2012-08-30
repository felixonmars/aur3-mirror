# Creator: nullren <chopflop@gmail.com>
# Maintainer: tj vanderpoel <tj@rubyists.com>
pkgname=bitlbee-skype
pkgver=0.9.0
pkgrel=2
pkgdesc="Skype plugin for BitlBee"
arch=(i686 x86_64)
url="https://github.com/vmiklos/bitlbee-skype/"
license=('GPL')
install="$pkgname.install"
depends=(bitlbee skype4py pygtk python2-pyopenssl dbus-python)
source=("https://github.com/downloads/vmiklos/bitlbee-skype/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('ecf4be8ffeb0d2bb95bd7ab2077718a6')
