# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Maintainer: Richard McCormack <richard@dinocampaign.info>
pkgname=qamix
pkgver=0.0.7e
pkgrel=6
arch=('i686' 'x86_64')
pkgdesc="A graphical ALSA mixer"
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('qt3' 'alsa-lib')
source=(http://downloads.sourceforge.net/alsamodular/$pkgname-$pkgver.tar.bz2)
md5sums=('e902774238b57859e0ff695771821b7b')

package() {
  cd $srcdir/$pkgname-$pkgver
  make QT_BASE_DIR=/opt/qt -f make_$pkgname || return 1
  install -d $pkgdir/usr/{share/$pkgname,bin} || return 1
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
  echo "Categories=Audio;" >> $pkgdir/usr/share/applications/$pkgname.desktop
  cp *.xml $pkgdir/usr/share/$pkgname
}
