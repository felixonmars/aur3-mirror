# Contributor: Oscar Carlsson ( oscar.carlsson at gmail dot com )

pkgname=hunspell-sv-se
pkgver=20101007
pkgrel=2
pkgdesc="Swedish dictionary for Hunspell"
arch=('i686' 'x86_64')
url="http://hunspell.sourceforge.net/"
license=('LGPL' 'BSD')
depends=('hunspell')
source=(http://extensions.services.openoffice.org/e-files/1080/8/ooo_swedish_dict_1.44.oxt)
md5sums=('097b446ccf975c7096f487a039d422f6')

build() {
  cd $srcdir/dictionaries
  install -D -m644 sv_SE.dic $pkgdir/usr/share/myspell/dicts/sv_SE.dic
  install -D -m644 sv_SE.aff $pkgdir/usr/share/myspell/dicts/sv_SE.aff
  install -D -m644 ../LICENSE_sv_SE.txt $pkgdir/usr/share/licenses/hunspell-sv-se/license.txt
}
