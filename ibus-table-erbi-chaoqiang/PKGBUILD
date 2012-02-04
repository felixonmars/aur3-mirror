pkgname=ibus-table-erbi-chaoqiang
pkgver=2010_1_5
pkgrel=1
pkgdesc="The Chaoqiang Erbi Input Method of tables engines for IBus.;ibus下的超强二笔"
arch=('i686' 'x86_64')
url="http://forum.ubuntu.org.cn/viewtopic.php?f=8&t=179539"
license=('LGPL')
depends=('ibus-table>=1.2.0')
provides=('ibus-table-chaoqiangerbi=090726')
conflicts=()
makedepends=('')
options=('!libtool')
source=(https://chaoqiangerbi.googlecode.com/files/chaoqiangerbi.tar.gz)

build() {
  cd $srcdir/ 
  mkdir -p $pkgdir/usr/share/ibus-table/icons/
  mkdir -p $pkgdir/usr/share/ibus-table/tables
  install erbi-cq.png $pkgdir/usr/share/ibus-table/icons/
  install erbi-cq.db $pkgdir/usr/share/ibus-table/tables/ || return 1

} 

md5sums=('870b8d7aa2eb8e1ddb50a1d4144f1ac8')
