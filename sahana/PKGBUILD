# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Ashok `ScriptDevil` Gautham <ScriptDevil@gmail.com>

pkgname=sahana
pkgver=0.6.6
pkgrel=1
pkgdesc="A web-based disaster management system"
arch=('any')
url="http://www.sahana.lk/"
license=('LGPL')
depends=('apache>=2.0' 'mysql>=4.1' 'php>=5.0')
source=(http://launchpad.net/sahana-agasti/krakatoa/$pkgver/+download/$pkgname-$pkgver.tgz)
md5sums=('d5da9c640461de1d04c55f7b248d9843')

build() {
  install -dm755 $pkgdir/{usr/share,var/www}
  cp -r $srcdir/$pkgname-phase2 $pkgdir/usr/share/$pkgname
  ln -sf /usr/share/$pkgname/www $pkgdir/var/www/$pkgname
}
