# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=tahoefs-git
pkgver=32.9eb10f1
pkgrel=1
pkgdesc="A fuse interface implementation for the Tahoe-LAFS written in C"
arch=('i686' 'x86_64')
url='https://github.com/keiichishima/tahoefs'
license=('custom')
depends=('tahoe-lafs' 'curl' 'fuse' 'json-c')
makedepends=('git')
provides=('tahoefs')
conflicts=('tahoefs')
source=('git://github.com/keiichishima/tahoefs'
        'LICENSE')
md5sums=('SKIP'
         '2e515a61e485918c7e62036188e5871e')

pkgver() {
  cd tahoefs
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd tahoefs
  make
}

package() {
  install -Dm755 tahoefs/tahoefs "${pkgdir}"/usr/bin/tahoefs
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
