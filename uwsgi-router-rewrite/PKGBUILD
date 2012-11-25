# Contributor: Kevin Zuber <uKev@knet.eu>
# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=uwsgi-router-rewrite
_pkgbase=uwsgi
_plugin=router_rewrite
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="router_rewrite plugin for uWSGI"
arch=(i686 x86_64)
url="http://projects.unbit.it/uwsgi/"
license=('GPL2')
groups=()
depends=(uwsgi-core pcre)
makedepends=(python2)
checkdepends=()
provides=()
conflicts=()
replaces=(uwsgi)
backup=()
options=()
install=
changelog=
source=(http://projects.unbit.it/downloads/$_pkgbase-$pkgver.tar.gz)
noextract=()
md5sums=('0e83c1ef1b7b01a16c87884d23030ce2')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 uwsgiconfig.py --plugin plugins/${_plugin} core ${_plugin}
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  mkdir -p "$pkgdir/usr/lib/uwsgi/"
  install -Dm555 ${_plugin}_plugin.so "$pkgdir/usr/lib/uwsgi"
  mkdir -p "$pkgdir/usr/bin/"
  ln -s "/usr/bin/uwsgi" "$pkgdir/usr/bin/uwsgi_${_plugin}"
}
