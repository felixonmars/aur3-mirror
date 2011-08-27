# Maintainer: Denis Moiseev <imdens@gmail.com>
pkgname=jasper_journeys
pkgver=2.12
pkgrel=1
pkgdesc="A fantasy platform adventure game"
_down=jasper_linux_i386_3.zip
arch=('i686')
url="http://lexaloffle.com"
license=('custom')
makedepends=(unzip)
source=(http://www.lexaloffle.com/files/misc/$_down
	jasperj.desktop
	jasperj.png
	jasperj)
md5sums=('f9a2ed5ebd1a116fab25ed59bd126323'
         '7832b1bf42a411d2eb3b9021a5d1ffaa'
         'ec61dbb54054f72b6453fbef6d61e3ca'
         '3976db44426ad6549286d64de8ff87ba')
package() {
  mkdir $pkgdir/usr/share/jasperjourney "$pkgdir"/usr/bin -p
  cd $pkgdir/usr/share/jasperjourney
  unzip $srcdir/$_down
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/COPYING || return 1
  install -D -m644 $srcdir/jasperj.desktop $pkgdir/usr/share/applications/jasperj.desktop || return 1
  install -D -m644 $srcdir/jasperj.png $pkgdir/usr/share/pixmaps/jasperj.png || return 1
  install -D -m755 $srcdir/jasperj $pkgdir/usr/bin/jasperj || return 1
}
