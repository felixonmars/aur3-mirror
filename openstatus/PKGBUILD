# Maintainer: Hank Donnay <hank@hdonnay.com>
pkgname=openstatus
pkgver=0.6.1
pkgrel=1
pkgdesc="Lightweight system monitoring utility."
arch=('any')
url="http://openstatus.nickmoeck.com/"
license=('GPL')
depends=('json-c' 'python2' 'python-configobj' 'twisted' 'php-sqlite' 'php-gd')
optdepends=('python2-setproctitle: Changing process titles')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nickmoeck/OpenStatus/tarball/v$pkgver"
        "openstatus-server.rc"
        "openstatus-client.rc")
md5sums=('6f1f88858483b70c712fcd45d0c70b81'
         'a08dbb9276ccc8c01daab2f2e4ea57d4'
         '7de951965868dd8db1659cd3df06efbf')

build() {
  cd "$srcdir/"
  mv ./nickmoeck-OpenStatus-* ./$pkgname-$pkgver
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make DESTDIR="$pkgdir/" install
  install -d $pkgdir/etc/openstatus $pkgdir/etc/rc.d $pkgdir/usr/bin $pkgdir/usr/share/openstatus
  install -T $startdir/openstatus-client.rc $pkgdir/etc/rc.d/openstatus-client
  install -T $startdir/openstatus-server.rc $pkgdir/etc/rc.d/openstatus-server
  install -m a-x -t $pkgdir/etc/openstatus openstatus-client.conf openstatus-server.conf openstatus.db config.php
  install -t $pkgdir/usr/bin/ openstatus-client openstatus-server
  cp -r web $pkgdir/usr/share/openstatus/
  cp -r scripts $pkgdir/usr/share/openstatus/
}

# vim:set ts=2 sw=2 et:
