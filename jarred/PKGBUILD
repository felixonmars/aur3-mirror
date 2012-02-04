# Maintainer: Paul Colomiets <paul@colomiets.name>

pkgname=jarred
pkgver=0.2
pkgrel=1
pkgdesc="A web frontend to collectd and rrd to json command-line extractor"
arch=('i686' 'x86_64')
url="http://github.com/tailhook/jarred"
license=('MIT')
depends=('zeromq' 'rrdtool')
optdepend=(
    "zerogw: Running web frontend"
    )
backup=()
source=(
    "https://github.com/downloads/tailhook/jarred/$pkgname-$pkgver.tar.gz"
    "jarred.install"
    )
md5sums=('3fcd9645c19a142c9ab7e373b7d3a943' 'edb081accac11c7bb84981abe0063b83')
install=(jarred.install)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./waf install --destdir=$pkgdir
  install -d -m 755 $pkgdir/etc/jarred
  ln -s /usr/share/jarred/public/js/all.js $pkgdir/etc/jarred/all.js
  install -D -m 755 jarred.rc $pkgdir/etc/rc.d/jarred
  install -D -m 644 jarred-zerogw.yaml $pkgdir/etc/zerogw.d/jarred.yaml
  mkdir -p $pkgdir/usr/share/jarred/public
  cp -R public/* $pkgdir/usr/share/jarred/public
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
