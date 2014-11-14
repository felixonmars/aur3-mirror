# Maintainer: Gordin <9ordin @t gmail>

pkgname=schmutz
pkgver=0.1
pkgrel=3
pkgdesc="Though̔ts ̵o͘f ̵d̔ir̔t ͓spill ̜o͘ve̜r to͓ your u̵nic̵od̔e e̔na̔ble̜d͓ tex͓t."
arch=('x86_64' 'i686')
url="https://github.com/githubert/$pkgname"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://raw.githubusercontent.com/githubert/$pkgname/5e3c94483ed0897e017af591ba6117cab4952831/${pkgname}.go")
sha256sums=('01f2d64f567c6d8c68dcb2d2baed4d674465c3635984442899608ff768a1ca7f')

build() {
  go build -o "$pkgname"
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
