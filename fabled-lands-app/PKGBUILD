# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=fabled-lands-app
_pkgname=flands
pkgver=1.0.4
_pkgver=104
pkgrel=1
pkgdesc="An adaptation of the Fabled Lands gamebook series."
url="http://flapp.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=(http://garr.dl.sourceforge.net/project/flapp/Binary%20%28ready%20to%20play%29/$pkgver/BigFLApp_$_pkgver.zip
        $_pkgname.sh
        $_pkgname.desktop)
noextract=('BigFLApp_$_pkgver.zip')
install=$_pkgname.install
md5sums=('5152c43941b6cbadfa1e18f15c5411be'
         '561345ca40decbde7d9df800c931e620'
         'c56b2629147225086ac8ed0c95e566eb')

build() {
  cd $srcdir

  mkdir -p $pkgdir/opt/$_pkgname
  unzip -q -o BigFLApp_$_pkgver.zip -d $pkgdir/opt/$_pkgname

  install -D -m755 $startdir/$_pkgname.sh $pkgdir/usr/bin/$_pkgname
  install -D -m644 $startdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -D -m644 $pkgdir/opt/$_pkgname/icon.jpg $pkgdir/usr/share/pixmaps/$_pkgname/icon.jpg
  install -D -m644 $pkgdir/opt/$_pkgname/README.txt $pkgdir/usr/share/doc/$_pkgname/README.txt

  # Fix permissions for a configure file.
  chmod 766 $pkgdir/opt/$_pkgname/user.ini
  # Set the path to a save directory.
  sed -i '$a\SaveDir=~/' $pkgdir/opt/$_pkgname/user.ini

  rm $pkgdir/opt/$_pkgname/{*.ico,icon.jpg,*.bat,*.txt}
}
# vim:set ts=2 sw=2 et:
