# pkgbuild by peter feigl <peter.feigl@jku.at>
pkgname=g13
pkgver=0.1
pkgrel=1
pkgdesc="Driver for the Logitech G13 keyboard"
arch=('i686' 'x86_64')
url="http://eutyche.swe.uni-linz.ac.at/g13"
license=('GPL v2')
source=(http://eutyche.swe.uni-linz.ac.at/g13/g13.tar.bz2)

build()
{
  # Extract
  cd $startdir/src/g13
  make
  mkdir -p $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/input/
  install -m644 g13.ko $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/input
  echo "Please run depmod -a as root"
}

md5sums=('0ecab28b9767061740b29c53f0c0863e')
