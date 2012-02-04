# Contributor:  Miguel Useche <migueluseche@skatox.com>
arch=(i686 x86_64)
pkgname=dbwrench
pkgver=1.9.6
pkgrel=1
pkgdesc="Database design & synchronization software"
url="http://www.dbwrench.com/"
license=('freeware')
depends=('java-runtime')
source=(http://www.dbwrench.com/download/files/$pkgname.zip dbwrench)
md5sums=('4fb2215192f71c9347f71011c31d899a' '7495b69c0985635a92f8e924fb219e33')

build() {
  mkdir -p $startdir/pkg/usr/share/$pkgname
  mkdir -p $startdir/pkg/usr/bin/
  cd $startdir/src/
  rm DbWrenchW.exe
  cp $startdir/src/* $startdir/pkg/usr/share/$pkgname -r
  cp $startdir/src/dbwrench $startdir/pkg/usr/bin/
}
