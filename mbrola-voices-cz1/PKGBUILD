# Contributor: Changaco <me@changaco.net>
# Maintainer: mmm
pkgname=mbrola-voices-cz1
pkgver=991020
_pkgver2=001009
pkgrel=2
pkgdesc="A czech male & female diphone voices for mbrola TTS text-to-speech, use with festival/espeak too."
arch=(i686 x86_64)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-cz)
depends=(mbrola)
license=(custom)
source=(http://tcts.fpms.ac.be/synthesis/mbrola/dba/cz1/cz1-$pkgver.zip
	http://tcts.fpms.ac.be/synthesis/mbrola/dba/cz2/cz2-$_pkgver2.zip)
md5sums=('e9ffbbc4411e247d505e760773d11b31'
	 'e9d28a9ec9ff4e6e43fa8bb3bc1577c3')


build(){
  cd $srcdir
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/ $pkgdir/usr/share/mbrola/{cz1,cz2}/
  mv cz1/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  
  cd cz1
  cp cz1 $pkgdir/usr/share/mbrola/cz1/
  cp -r TEST $pkgdir/usr/share/mbrola/cz1/

  cd $srcdir
  cp cz2 $pkgdir/usr/share/mbrola/cz2/
  cp -r Test $pkgdir/usr/share/mbrola/cz2/
}
