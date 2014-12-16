# Maintainer: archtux <antonio dot arias99999 at gmail dot com>
 
pkgname=raptor-chess-interface
pkgver=98u3f5
pkgrel=2
pkgdesc="Raptor is a cross platform chess interface and pgn viewer that currently supports FICS and BICS."
arch=('i686' 'x86_64')
url="http://code.google.com/p/raptor-chess-interface/"
license=('BSD')
depends=('java-runtime=8' 'sox')
 
if [[ $CARCH == x86_64 ]]; then
srcmd5='37db9ddc747783b26f5165eb0bedeb15'
arch=_64
elif [[ $CARCH == i686 ]]; then
srcmd5='dd39141c546f6e4cb864b57639304306'
fi

source=(http://raptor-chess-interface.googlecode.com/files/Raptor_v${pkgver}_Linux_x86${arch}_GTK2.zip 'raptor' 'raptor.desktop')
md5sums=($srcmd5
        '68941ff765acfcf7483c3d62f2184e7d'
        '8e19a8009285e3292ae6da0768f40547')

package() {
  cd $srcdir/Raptor_v${pkgver}
 
  mkdir -p $pkgdir/opt/raptor
  cp -R * $pkgdir/opt/raptor
  install -Dm644 ./resources/images/raptorIcon.gif $pkgdir/usr/share/pixmaps/raptor.gif
  cd ..
  install -Dm755 raptor $pkgdir/usr/bin/raptor
 
  # Desktop file
  install -Dm644 raptor.desktop $pkgdir/usr/share/applications/raptor.desktop
}