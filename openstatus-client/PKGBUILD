# Maintainer: Hank Donnay <hank@hdonnay.com>
pkgname=openstatus-client
pkgver=0.6.1
pkgrel=1
pkgdesc="Client component of OpenStatus."
arch=('any')
url="http://openstatus.nickmoeck.com/"
license=('GPL')
depends=('json-c' 'python2' 'python-configobj')
optdepends=('python2-setproctitle: Changing process titles')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nickmoeck/OpenStatus/tarball/v$pkgver" "openstatus-client.rc")
md5sums=('6f1f88858483b70c712fcd45d0c70b81'
         '7de951965868dd8db1659cd3df06efbf')

build() {
  cd "$srcdir/"
  mv ./nickmoeck-OpenStatus-* ./$pkgname-$pkgver
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/etc/openstatus
  mkdir -p $pkgdir/etc/rc.d
  mkdir -p $pkgdir/usr/bin
  install -t $pkgdir/etc/rc.d $startdir/openstatus-client.rc
  install -t $pkgdir/etc/openstatus ./openstatus-client.conf
  install -t $pkgdir/usr/bin/ ./openstatus-client
}

# vim:set ts=2 sw=2 et:
