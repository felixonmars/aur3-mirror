# Contributor: Josh Taylor (deficite) <joshtaylor.mail@gmail.com>
pkgname=ogrenewt
pkgver=1.62
pkgrel=2
pkgdesc="Library for embedding Newton Dynamics into OGRE"
arch=('i686' 'x86_64')
url="http://walaber.com/index.php?action=showitem&id=9"
license=('unrestricted')
depends=(ogre newton-dynamics boost)
makedepends=(unrar scons)
source=(http://walaber.com/misc/OgreNewt.rar)
md5sums=('2c35d19bfbb709b83d46275524124f8f')

build() {
  cd $startdir/src/
  unrar x OgreNewt.rar
  mv SConscript OgreNewt_Main
  scons
  scons install prefix="$startdir/pkg/usr/"
}
