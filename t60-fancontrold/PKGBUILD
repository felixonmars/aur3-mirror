# Contributor: Julien <paci79@free.fr>

pkgname=t60-fancontrold
pkgver=0.1.6.1
pkgrel=1
pkgdesc="t60-fancontrold is a bash script that dynamically controls the fan on the T60 ThinkPad"
arch=('i686' 'x86_64')
conflicts=('')
depends=('bash')
license=('GPL')
makedepends=('')
source=(http://hobbes.gmxhome.de/t60-fancontrold/t60-fancontrold-$pkgver.tar.gz http://zilwil.free.fr/lj/put/t60/t60-fancontrol)
url="http://hobbes.gmxhome.de/"

md5sums=('122fec320e2e39409f05de481763ee56 9b86e7b30075e76cc8699c0d13e92c60')

build() {

  cd ${startdir}/src/$pkgname-$pkgver

  install -d $startdir/pkg/usr/bin/
  install -d $startdir/pkg/etc/rc.d
  install $startdir/src/$pkgname-$pkgver/t60-fancontrold $startdir/pkg/usr/bin/t60-fancontrold
  install $startdir/src/$pkgname-$pkgver/t60-fancontrold.conf $startdir/pkg/etc/t60-fancontrold.conf
  rm t60-fancontrol; 
  install $startdir/t60-fancontrol $startdir/pkg/etc/rc.d/t60-fancontrol
  
}
