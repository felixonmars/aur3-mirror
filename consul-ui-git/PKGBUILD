# Maintainer: Joe Harrison <joehazzers@gmail.com>
pkgname="consul-ui-git"
pkgver=v0.4.0.r8.g36fd5f7
pkgrel=1
pkgdesc="Static web interface files for Consul."
arch=('any')
url="http://consul.io"
license=('custom:MPLv2')
conflicts=('consul-ui')
makedepends=('nodejs' 'ruby-sass' 'ruby-uglifier')
optdepends=('consul: used to serve the static html files')
source=("$pkgname::git+https://github.com/hashicorp/consul.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/ui"

  make dist
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir/$pkgname/ui"

  install -Ddm755 dist/ "$pkgdir/usr/share/consul/ui"
  install -Dm644 dist/index.html "$pkgdir/usr/share/consul/ui/index.html"
  install -Ddm755 dist/static/ "$pkgdir/usr/share/consul/ui/static"
  install -Dm644 dist/static/* "$pkgdir/usr/share/consul/ui/static"
}

