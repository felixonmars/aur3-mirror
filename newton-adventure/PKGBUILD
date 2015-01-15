# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=newton-adventure
pkgver=1.16
pkgrel=1
pkgdesc="A 2D platform game where the hero can change gravity direction"
arch=('i686' 'x86_64')
url="http://devnewton.bci.im/games/newton_adventure"
license=('BSD' 'CC-BY-SA')
depends=('java-runtime')
source=(http://dl.bci.im/games/newton_adventure/$pkgname-installer-$pkgver.jar
        $pkgname.desktop
        $pkgname.sh)
md5sums=('7d92bc1c7ea4cd420c4e31f395a3235b'
         '516cff81dffc254a39735f0e1bd87f03'
         '77a9e5c90397f7ecf5202f7c4f6a9a5b')

package() {
  source /etc/profile.d/jre.sh

  echo "INSTALL_PATH=$pkgdir/opt/$pkgname" >install.properties
  java -jar $pkgname-installer-$pkgver.jar -options install.properties

  # Start file
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  
  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  cd $pkgdir/opt/$pkgname
  install -Dm644 icon.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # Delete unneeded files
  rm -rf Uninstaller
  rm *{osx*,windows*}
  
  if [ "${CARCH}" = 'x86_64' ]; then
     rm natives/*{linux.so,jgl.so,openal.so}
  elif  [ "${CARCH}" = 'i686' ]; then
     rm natives/*64.so
  fi  
}