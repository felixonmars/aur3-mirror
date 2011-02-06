# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=boa
pkgver=0.94.13
pkgrel=1
pkgdesc="Lightweight high performance web server"
url="http://www.boa.org/"
license=
depends=('glibc')
makedepends=('gcc' 'automake' 'bison' 'flex')
conflicts=()
replaces=()
backup=(etc/boa/boa.conf var/log/boa/access_log var/log/boa/error_log)
install=
source=(http://www.boa.org/$pkgname-$pkgver.tar.gz compat.h.diff boa.conf.diff boa mime.types)
md5sums=('c8d6f46f9aa60909f171529068813fe0' '622baa6748c42cfb6e2d111ca0f9e5a4' '4b88ddace9c287879001a3041012ca06' '9417a7fc792248caa9038e4bae4670bd' '8b6624bc0fe35464c41bc46ef385aded')

build() {
  cd $startdir/src/$pkgname-$pkgver/src
  patch compat.h $startdir/src/compat.h.diff
  patch ../boa.conf $startdir/src/boa.conf.diff
  ./configure --prefix=/usr && make
  install -d $startdir/pkg/usr/sbin
  install -d $startdir/pkg/usr/lib/boa
  install -d $startdir/pkg/etc/rc.d
  install -d $startdir/pkg/etc/boa
  install -d $startdir/pkg/usr/man/man8
  install -d $startdir/pkg/var/log/boa
  install -d $startdir/pkg/var/www
  install boa $startdir/pkg/usr/sbin
  install boa_indexer $startdir/pkg/usr/lib/boa
  install $startdir/src/boa $startdir/pkg/etc/rc.d
  install -m 644 ../boa.conf $startdir/pkg/etc/boa
  install -m 644 $startdir/src/mime.types $startdir/pkg/etc/boa
  install -m 644 ../docs/boa.8 $startdir/pkg/usr/man/man8
}
