# Contributer: giacomogiorgianni@gmail.com 

pkgname=easywake
_name=EasyWake
pkgver=3
pkgrel=0
pkgdesc="This is a tool to wake up devices (usually computers) over a network connection. The destination device has to support Wake-on-Lan"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://opendesktop.org/content/show.php/EasyWake?content=158188"
depends=('qt4')
#optdepends=()
makedepends=('make')
#install=${pkgname}.install
#changelog=$pkgname.changelog
source=("$_name-$pkgver-$pkgrel-Source.zip::http://www.blural-development.de/download/download.php?id=9")
md5sums=(3a7179a6a0fc5d5d4c14f3d8e238d28c)

build() {
  cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  jc=$((${cpucount:-1}))

  cd $srcdir/$_name-$pkgver-$pkgrel-Source/Build
  #./lang_unix
  #lrelease QMPlay2.pro
  qmake-qt4 $_name.pro PREFIX=/usr -Wnone
  make -j $jc || return 1
}

package() {
   cd $srcdir/$_name-$pkgver-$pkgrel-Source/Build
   install -Dm755 "$_name" "$pkgdir"/usr/bin/$pkgname
   #make DESTDIR="$pkgdir" install
}
