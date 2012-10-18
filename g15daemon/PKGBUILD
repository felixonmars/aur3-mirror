# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=1.9.5.3
pkgrel=5
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('libg15' 'libg15render>=1.2')
options=(!libtool)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        g15daemon
        g15daemon.service
        $pkgname-$pkgver-uinput.patch
        $pkgname-$pkgver-config-write.patch
        $pkgname-$pkgver-recv-oob-answer.patch)
md5sums=('2cd8b4f1bd039bf804f1f472216742f0'
         'ffd5edc0a1e73fb629eb2afe1966018e'
         '7d5d44b97ce2ff6d52ad4bb041f8777c'
         '6c3d5b2b7c585dc095118f80e4d72204'
         'd47755aa8387e89fedffdb28ff3b18de'
         '275c28e4950e05336086419873ff8e45')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -Np1 -i "$srcdir"/$pkgname-$pkgver-uinput.patch
  patch -Np1 -i "$srcdir"/$pkgname-$pkgver-config-write.patch
  patch -Np1 -i "$srcdir"/$pkgname-$pkgver-recv-oob-answer.patch

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -D -m 755 "$srcdir"/g15daemon "$pkgdir"/etc/rc.d/g15daemon
  install -D -m 644 "$srcdir"/g15daemon.service "$pkgdir"/usr/lib/systemd/system/g15daemon.service
}
