# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=difmplay
pkgver=20140819
pkgrel=1
pkgdesc="Script to ease playing music from di.fm and sky.fm internet radio"
arch=('any')
license=('public domain')
url="http://tukaani.org/difmplay/"
depends=('bash' 'mplayer' 'dialog' 'util-linux')
source=('http://tukaani.org/difmplay/difmplay')
md5sums=('293fad6cc9fc213cc228708534012a30')
package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/difmplay $pkgdir/usr/bin/ 
  }
