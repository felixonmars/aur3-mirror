pkgname=acccheck
pkgver=0.2.1
_pkgver=${pkgver//./-}
pkgrel=1
url='https://labs.portcullis.co.uk/tools/acccheck/'
pkgdesc='Password dictionary attack tool for SMB'
arch=('any')
license=('GPL2')
depends=('perl' 'smbclient')
source=("https://labs.portcullis.co.uk/download/acccheck-${_pkgver}.tar.gz")
md5sums=('ad14f58e04bc683fce5f72ef3cdb745d')

package() {
  cd $srcdir/$pkgname-$_pkgver
  install -dm755 $pkgdir/usr/bin $pkgdir/usr/share/licenses/$pkgname
  install -m755 acccheck.pl $pkgdir/usr/bin
  install -m644 COPYING.ACCCHECK README.TXT $pkgdir/usr/share/licenses/$pkgname

}

