# Maintainer: Heli Villarreal <acmzero at gmail dot com>
# 07-04-2013

pkgname=obstack-ireport
pkgver=4.0.1
pkgrel=1
pkgdesc="A visual report builder for JasperReports (Part of the Openbravo stack)"
license="GPL"
url="http://jasperforge.org/projects/ireport"
source=(http://switch.dl.sourceforge.net/sourceforge/iReport/iReport-$pkgver.tar.gz)
depends=("jdk")
md5sums=('2dcf478b5214ea40d453cdb503b38d22')
arch=('i686, x86_64')

package() {

  cd $srcdir
  mkdir -p $pkgdir/usr/share/iReport

  rm $srcdir/iReport-$pkgver/bin/*.exe

  cp -r $srcdir/iReport-$pkgver/* $pkgdir/usr/share/iReport/
  convert $srcdir/iReport-$pkgver/bin/document.ico $srcdir/iReport-$pkgver/bin/ireport.png
  mv $srcdir/iReport-$pkgver/bin/ireport-6.png $srcdir/iReport-$pkgver/bin/ireport.png
  rm $srcdir/iReport-$pkgver/bin/ireport-*.png
  install -D -m644 $srcdir/iReport-$pkgver/LICENSE_ireport.txt $pkgdir/usr/share/licenses/iReport/LICENSE
  install -D -m644 $srcdir/iReport-$pkgver/bin/ireport.png $pkgdir//usr/share/pixmaps/ireport.png
  install -D -m644 ../iReport.desktop $pkgdir/usr/share/applications/iReport.desktop

  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/iReport/bin/ireport $pkgdir/usr/bin/

}
