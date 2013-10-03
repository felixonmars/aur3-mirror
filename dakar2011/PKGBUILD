# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=dakar2011
pkgver=2986
pkgrel=5
pkgdesc="3D game, where you can drive like in the Dakar rally."
arch=('i686' 'x86_64')
url="http://dakar2011.sourceforge.net/"
license=('GPL3')
depends=('libxcursor' 'libxxf86vm')
[ "$CARCH" == "x86_64" ] && depends=('lib32-libxcursor' 'lib32-libxxf86vm')
source=(http://sourceforge.net/projects/dakar2011/files/final/Dakar2011_win32_linux32_bin_build${pkgver}_v$pkgrel.zip
        http://www.ambiera.at/downloads/irrKlang-1.4.0.zip
        $pkgname
        $pkgname.desktop)
md5sums=('f79f2a42e62d26a3c093b877642f3481'
         '4d2276e6eeb5ab0ae4c98e4e017800b7'
         '79636064a4c359f6410d065a4e08223d'
         'f6e1b41a0a1b9eaa7c0fd286ce4a4814')


package() {
  cd $srcdir/Dakar2011

  # Remove obsolete stuff
  rm -rf win32-gcc/ *dll *exe

  # Data
  cd ..
  install -d $pkgdir/usr/share/$pkgname/irrKlang-1.3.0/bin
  cp -r irrKlang-1.4.0/bin/linux-gcc $pkgdir/usr/share/$pkgname/irrKlang-1.3.0/bin
  cp -r Dakar2011 $pkgdir/usr/share/$pkgname
  mv $pkgdir/usr/share/$pkgname/Dakar2011 $pkgdir/usr/share/$pkgname/game

  # Desktop Icon
  install -Dm644 Dakar2011/Dakar2011.ico $pkgdir/usr/share/pixmaps/Dakar2011.ico
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop  

  # Start file
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

  # Write permissions
  chmod 777 -R $pkgdir/usr/share/$pkgname
}