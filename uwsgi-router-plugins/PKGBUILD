# Contributor: Kevin Zuber <uKev@knet.eu>, Damjan Georgievski <gdamjan@gmail.com>
# Maintainer: Kevin Zuber <uKev@knet.eu>
pkgname=('uwsgi-router-plugins')
_pkgbase=uwsgi
pkgver=1.4.9
pkgrel=1
epoch=
pkgdesc="uWSGI is a fast, self-healing and developer/sysadmin-friendly application container server coded in pure C. Splitted package to support python, python2, ruby (rack), ... "
arch=(i686 x86_64 arm armv6h)
url="http://projects.unbit.it/uwsgi/"
license=('GPL2')
groups=()
depends=(libyaml jansson uwsgi-core pcre)
makedepends=(python)
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://projects.unbit.it/downloads/$_pkgbase-$pkgver.tar.gz)
noextract=()
md5sums=('3fe995a39e0489621ddcc7acfbd49171')


build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python uwsgiconfig.py --plugin plugins/corerouter core corerouter
  python uwsgiconfig.py --plugin plugins/fastrouter core fastrouter
  python uwsgiconfig.py --plugin plugins/router_uwsgi core router_uwsgi
  python uwsgiconfig.py --plugin plugins/router_http core router_http
  python uwsgiconfig.py --plugin plugins/router_redirect core router_redirect
  python uwsgiconfig.py --plugin plugins/router_rewrite core router_rewrite
  python uwsgiconfig.py --plugin plugins/router_basicauth core router_basicauth
  python uwsgiconfig.py --plugin plugins/router_cache core router_cache

}

package() {

  cd "$srcdir/$_pkgbase-$pkgver"
  mkdir -p "$pkgdir/usr/lib/uwsgi/"
  mkdir -p "$pkgdir/usr/bin/"
  install -Dm555 corerouter_plugin.so "$pkgdir/usr/lib/uwsgi"
  install -Dm555 fastrouter_plugin.so "$pkgdir/usr/lib/uwsgi"
  install -Dm555 router_uwsgi_plugin.so "$pkgdir/usr/lib/uwsgi"
  install -Dm555 router_http_plugin.so "$pkgdir/usr/lib/uwsgi"
  install -Dm555 router_redirect_plugin.so "$pkgdir/usr/lib/uwsgi"
  install -Dm555 router_rewrite_plugin.so "$pkgdir/usr/lib/uwsgi"
  install -Dm555 router_basicauth_plugin.so "$pkgdir/usr/lib/uwsgi"
  install -Dm555 router_cache_plugin.so "$pkgdir/usr/lib/uwsgi"
}
