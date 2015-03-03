# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=lucas-chess-wine
pkgver=8.11
pkgrel=1
pkgdesc="One of the most comprehensive chess learning tools for engine assisted training."
arch=('any')
url="http://www-lucaschess.rhcloud.com/"
license=('GPL2')
depends=('wine')
source=(https://2dc90e9d4d8c66f3ab71f42ff9cd1b6ab1f26543.googledrive.com/host/0B0D6J3YCrUoublFqc0VGZWw3VVU/release/LucasChessPortable811.exe
        $pkgname.png::http://i.computer-bild.de/imgs/4/6/6/6/6/3/8/Icon-Lucas-Schach-Portable-48x48-ee6f19caa2accd84.png
        $pkgname
        $pkgname.desktop)
md5sums=('5b45c9400a7cfee75f195b4201a9521d'
         'ee6f19caa2accd848043c17a48eb7a5b'
         '2153bccdc111e604c6b2c686d78c7a11'
         '6b92cdee73a0768d1a549907d2b3af18')

package() {
  cd $srcdir/LucasChess
  mkdir -p $pkgdir/usr/share/Lucas-Chess-Wine
  cp -rf ./* $pkgdir/usr/share/Lucas-Chess-Wine

  # Start file
  cd ..
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  
  # Desktop icon
  install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop  

  # Make directory writeable
  chmod o+w $pkgdir/usr/share/Lucas-Chess-Wine
}