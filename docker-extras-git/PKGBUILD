# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: system
pkgname='docker-extras-git'
pkgver=r9.39b529e
pkgrel=1
pkgdesc='Helper scripts for everyday docker use'
arch=('any')
url='https://github.com/sameersbn/docker-extras'
license=('unknwon')
depends=('docker')
provides=('docker-extras')
conflicts=('docker-extras')
source=('git+https://github.com/sameersbn/docker-extras.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/docker-extras"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/docker-extras"
    make prefix="$pkgdir/usr/bin" install
}
