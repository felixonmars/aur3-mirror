# Maintainer Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=lure-it
pkgver=1.1
pkgrel=3
pkgdesc="Lure of the Temptress. Italian version"
arch=('any')
url="http://www.revolution.co.uk/_display.php?id=10"
license=('custom')
depends=('scummvm')
conflicts=('lure')
source=(http://downloads.sourceforge.net/scummvm/$pkgname-$pkgver.zip 
	    https://scummvm.svn.sourceforge.net/svnroot/scummvm/scummvm/tags/release-0-11-1/dists/engine-data/lure.dat 
	    lure.sh)
md5sums=('adcb47523294fdbbc0872ec6140b4722'
         'd92372e7eead8d6e64f40cce381ec6ea'
         '31dbf8482e253504aa2fb6d74643c60a')

package() {
  install -m755 -D lure.sh $pkgdir/usr/bin/lure.sh
  mkdir -p $pkgdir/usr/share/$pkgname
  install -m644 -D lure.dat $pkgdir/usr/share/$pkgname/

  cd $pkgname
  install -m644 *.VGA Manual.pdf $pkgdir/usr/share/$pkgname/
  install -m644 -D LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt

}
