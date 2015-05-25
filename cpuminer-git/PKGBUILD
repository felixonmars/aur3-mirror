# Maintainer: Noel Maersk <veox at wemakethings dot net>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=cpuminer-git
_gitname=cpuminer
pkgver=336.f3b0aab
pkgrel=1
pkgdesc="Multi-threaded CPU miner for Bitcoin and Litecoin (git version)"
arch=('i686' 'x86_64')
url="https://github.com/pooler/cpuminer"
license=('GPL2')
depends=('curl>=7.34.0' 'jansson')
makedepends=('git' 'autoconf' 'automake' 'yasm')
provides=('cpuminer')
conflicts=('cpuminer')
source=('cpuminer::git+http://github.com/pooler/cpuminer.git'
        'cpuminer.service')
md5sums=('SKIP'
         'ee2e856e79de3ff76735c851bd43e2d9')
backup=(etc/cpuminer.json)

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/${_gitname}"

  # Use in-tree jansson
  # sed -e 's/^AC_CHECK_LIB(jansson, json_loads, request_jansson=false, request_jansson=true)$/request_jansson=true/' -i configure.ac

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_gitname}"

  make DESTDIR="$pkgdir/" install
  install -Dm600 "example-cfg.json" "$pkgdir/etc/${_gitname}.json"
  install -Dm755 "$srcdir/cpuminer.service" "$pkgdir/usr/lib/systemd/system/${_gitname}.service"

  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
