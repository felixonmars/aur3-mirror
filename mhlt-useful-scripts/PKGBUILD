# Maintainer: Denis Sheremet <zaycakitayca@xaker.ru>
pkgname=mhlt-useful-scripts
pkgver=r2.7546fe5
pkgrel=1
pkgdesc="Additional scripts to increase MHLT functionality"
url="https://github.com/zaycakitayca/"
arch=('x86_64' 'i686')
license=('custom:WTFPL')
depends=()
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
provides=('mhlt-glue')
source=("mhlt-glue::git+https://github.com/zaycakitayca/mhlt-glue"
		"mhlt-scripts::git+https://github.com/zaycakitayca/mhlt-scripts")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/mhlt-scripts"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/mhlt-glue"
  make
}

package() {
  cd "${srcdir}/mhlt-glue"
  install -Dm755 "hlglue" "$pkgdir/usr/bin/hlglue"
  cd "${srcdir}/mhlt-scripts"
  install -Dm755 "test.sh" "$pkgdir/usr/bin/mhlt-complie-test"
  install -Dm755 "full.sh" "$pkgdir/usr/bin/mhlt-complie-full"
  install -Dm755 "netvis-client.sh" "$pkgdir/usr/bin/mhlt-netvis-client"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}