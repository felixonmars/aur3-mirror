#Contributor: Eichi <mail@der-eichi.de>
# fork from Contributor: Zerathidune <zerathidune@gmail.com> bluej PKGBUILD
# bluej file from packagebluej by Zerathidune <zerathidune@gmail.com>
pkgname=bluej-wsi
pkgver=2.5.1.2009.5.19
_pkgver=251
_wsidata=20090519
pkgrel=3
pkgdesc="special bluej version from the Wilhelm-Schickard-Institut - university tuebingen"
arch=('i686' 'x86_64')
url="http://www-pu.informatik.uni-tuebingen.de/users/crestani/info2-ss-09/"
license=('custom')
groups=()
depends=('java-environment')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www-pu.informatik.uni-tuebingen.de/users/crestani/info2-ss-09/BlueJ-generic-${_pkgver}-WSI-${_wsidata}.jar bluej-wsi)
noextract=()
md5sums=('32453d39a875d25015359cf10d011fb3'
         '27132f158825b30d3c4b8eda8b96829a')
build() {
  cd $srcdir
  bsdtar -x -f "bluej-dist.jar"
  mkdir -p "$pkgdir/usr/share/java/"
  cp -r lib "$pkgdir/usr/share/java/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r examples "$pkgdir/usr/share/$pkgname"
  install -m 755 -D -T bluej-wsi "$pkgdir/usr/bin/$pkgname"
}


