pkgname=bin32-go
pkgver=1.0.3
pkgrel=1
pkgdesc="Google Go runtime library (32-bit)"
arch=(x86_64)
url="http://golang.org"
license=("custom")
makedepends=(bash)
depends=(go)
options=(!strip)
source=("http://go.googlecode.com/files/go$pkgver.src.tar.gz")
md5sums=('31acddba58b4592242a3c3c16165866b')

build() {
  cd "$srcdir/go/src"
  GOOS=linux GOARCH=386 ./make.bash
}

package() {
  mkdir -p "$pkgdir/usr/lib/go/pkg/tool" "$pkgdir/usr/bin"
  cp -r "$srcdir/go/pkg/linux_386" "$pkgdir/usr/lib/go/pkg/"
  cp -r "$srcdir/go/pkg/tool/linux_386" "$pkgdir/usr/lib/go/pkg/tool/"
  install -Dm755 "$srcdir/go/pkg/tool/linux_amd64/8a" "$pkgdir/usr/lib/go/pkg/tool/linux_amd64/8a"
  install -m755 "$srcdir/go/pkg/tool/linux_amd64/8c" "$pkgdir/usr/lib/go/pkg/tool/linux_amd64/"
  install -m755 "$srcdir/go/pkg/tool/linux_amd64/8g" "$pkgdir/usr/lib/go/pkg/tool/linux_amd64/"
  install -m755 "$srcdir/go/pkg/tool/linux_amd64/8l" "$pkgdir/usr/lib/go/pkg/tool/linux_amd64/"
  echo '#!/bin/sh
GOOS=linux GOARCH=386 go $@' > "$pkgdir/usr/bin/go-32"
  chmod 755 "$pkgdir/usr/bin/go-32"
}