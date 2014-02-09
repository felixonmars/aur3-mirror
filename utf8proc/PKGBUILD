# Maintainer: lolilolicon #<moc.liamg@nocilolilol>.reverse

pkgname=utf8proc
pkgver=1.1.6
pkgrel=1
pkgdesc="C library for processing UTF-8 encoded Unicode strings"
arch=('i686' 'x86_64')
url="http://www.public-software-group.org/utf8proc"
license=('custom')
source=("http://www.public-software-group.org/pub/projects/utf8proc/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "utf8proc-1.1.6-buildflags.patch"
        "utf8proc-1.1.6-soname.patch")
md5sums=('2462346301fac2994c34f5574d6c3ca7'
         'e19f11bf48fd814f6b355df8de37385b'
         '7801006b616145f3f8ebf1b4a668509a')

prepare() {
  cd "$srcdir"/$pkgname-v$pkgver
  patch -Np1 -i ../"utf8proc-1.1.6-buildflags.patch"
  patch -Np1 -i ../"utf8proc-1.1.6-soname.patch"
}

build() {
  cd "$srcdir"/$pkgname-v$pkgver
  make libutf8proc.so
}

package() {
  cd "$srcdir"/$pkgname-v$pkgver
  install -Dm755 libutf8proc.so "$pkgdir"/usr/lib/libutf8proc.so
  install -Dm644 utf8proc.h "$pkgdir"/usr/include/utf8proc.h
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
