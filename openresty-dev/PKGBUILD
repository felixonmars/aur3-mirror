# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=openresty-dev
_pkgname=ngx_openresty
pkgver=1.5.8.1
pkgrel=1
pkgdesc="a powerful web app server by extending nginx. development release."
arch=('i686' 'x86_64')
url="http://openresty.org/"
license=('BSD')
groups=()
depends=('perl>=5.6.1' 'readline' 'pcre' 'openssl')
makedepends=()
optdepends=()
provides=("openresty=$pkgver")
conflicts=('openresty')
replaces=('openresty')
backup=()
options=()

source=(http://openresty.org/download/$_pkgname-$pkgver.tar.gz)
noextract=()

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/opt/openresty --with-luajit --with-http_postgres_module --with-http_realip_module
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('a80d35af95e1dc20c97a7a0df81aeb0d')
