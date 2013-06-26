# 1.0-2 Contributor: Nick Adams
# - Fixed dependency and added a new source link.
# - This no longer being actively developed.
#
# 1.0-1 Contributor: Jan Hambrecht <jaham at gmx dot net>

pkgname=kmm_kbanking
pkgver=1.0
pkgrel=2
pkgdesc="KBanking is the glue code needed to get the online banking features provided by AqBanking into KMyMoney"
arch=('i686' 'x86_64')
url="http://kmymoney2.sourceforge.net/plugins.html"
license=('GPL2')
depends=('kmymoney' 'aqbanking')
source=("http://web.archive.org/web/20120209165855/http://www.aquamaniac.de/sites/download/download.php?package=05&release=09&file=01&dummy=kmm_kbanking-1.0.tar.gz")
md5sums=('44ba5beb6a2c5ba9aab2e201810e98a3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --without-arts
  make || return 1
  make DESTDIR=$startdir/pkg install
}
