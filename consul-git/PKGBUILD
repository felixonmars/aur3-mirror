# Maintainer: Joe Harrison <joehazzers@gmail.com>
pkgname="consul-git"
pkgver=v0.4.0.r8.g36fd5f7
pkgrel=1
pkgdesc="Service discovery and configuration made easy. Distrubuted, highly available, and datacenter-aware."
arch=('x86_64')
url="http://consul.io"
license=('custom:MPLv2')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('consul')
install='consul.install'
source=("$pkgname::git+https://github.com/hashicorp/consul.git"
        'config.json'
        'consul.service')
sha256sums=('SKIP'
            '6c66b0c67d339b419bf369880ba69b55c6ba34ffefe403a9867943efd7a88fee'
            '50b0e9f54a1ee27bf6ce96b6f628728441562e73ae2217f2a1e827a6dc32ccd1')
_pkgpath="github.com/hashicorp/consul"

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"
  rm -rf "src/$_pkgpath"
  mkdir -p $(dirname "src/$_pkgpath")
  mv "$pkgbase" "src/$_pkgpath"
}

build() {
  export GOPATH="$srcdir"
  cd "$srcdir/src/$_pkgpath"

  make
}

package() {
  cd "$srcdir"

  install -Ddm750 "$pkgdir/etc/consul"
  install -Ddm750 "$pkgdir/etc/consul/conf.d"
  install -Ddm750 "$pkgdir/etc/consul/tls"

  install -Dm644 ../config.json "$pkgdir/etc/consul/conf.d/config.json"
  install -Dm644 ../consul.service "$pkgdir"/usr/lib/systemd/system/consul.service

  cd "$srcdir/src/$_pkgpath"

  install -Dm755 "bin/consul" "$pkgdir/usr/bin/consul"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

