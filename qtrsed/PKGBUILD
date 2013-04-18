# Contributer: giacomogiorgianni@gmail.com 

pkgname=qtrsed
pkgver=0.0.3
pkgrel=1
pkgdesc="A GUI for running sed stream editor. Written in C++ using Qt lib."
arch=('i686' 'x86_64')
license=('GPL')
url="http://opendesktop.org/content/show.php/QtrSed?content=158186"
depends=('qt4')
#optdepends=()
makedepends=('make')
#install=${pkgname}.install
#changelog=$pkgname.changelog
source=("$pkgname-$pkgver.zip::https://github.com/jadeatucker/qtrsed/archive/master.zip")
md5sums=(1f0a939e4c7509db1378fa6380459f47)

build() {
  cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  jc=$((${cpucount:-1}))

  cd $srcdir/$pkgname-master
  #./lang_unix
  #lrelease QMPlay2.pro
  qmake-qt4 $pkgname.pro PREFIX=$pkgdir/usr -Wnone
  make -j $jc || return 1
}

package() {
   cd $srcdir/$pkgname-master
   install -Dm755 "$pkgname" "$pkgdir"/usr/bin/$pkgname
   #make DESTDIR="$pkgdir" install
}
