# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=cute-converter
pkgver=2.1
pkgrel=1
pkgdesc="A units converter in PyQt"
arch=('any')
url='http://kde-apps.org/content/show.php/?content=122545'
license=('GPL3') 
depends=('python2' 'python2-qt')
source=(http://downloads.sourceforge.net/project/qt-converter/Source/qt-converter-${pkgver}.tar.bz2
	cute-converter.sh
	cute-converter.desktop)

package() {
  # Installing application
  cd $srcdir/Cute\ Converter/
  install -d -m755 $pkgdir/usr/lib/cute-converter
  cp -r -p * $pkgdir/usr/lib/cute-converter/
  rm $pkgdir/usr/lib/cute-converter/{README,COPYING}
  install -d -m755 $pkgdir/usr/bin
  install -D -m755 $srcdir/cute-converter.sh $pkgdir/usr/bin/cute-converter

  # Installing menu item
  install -D -m644 icons/converter.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

md5sums=('20a94137efdc4eb30c8ae2884d215794'
         'a036e6217c2f9ecf519f20eb0f2e0520'
         'a47d7a9f830d441d2953f9c591a94e27')