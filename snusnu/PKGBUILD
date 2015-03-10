# $Id: PKGBUILD 110816 2014-05-07 16:32:16Z arodseth $
# Maintainer: Alexander Rødseth <xyproto@archlinux.org>

pkgname=snusnu
pkgver=0.3
pkgrel=1
pkgdesc='Simple HTTP/2 webserver with support for Markdown'
arch=('x86_64' 'i686')
url='https://github.com/xyproto/snusnu/'
license=('MIT')
makedepends=('go' 'git')
source=("git://github.com/xyproto/snusnu.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"

  GOPATH="$srcdir" go get -d
}

build() {
  cd "$pkgname"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
