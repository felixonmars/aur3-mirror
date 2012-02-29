# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>


pkgname=mythbuntu-lirc-generator
pkgver=0.26
pkgrel=1
pkgdesc="Mythbuntu Lirc (lircrc) Configuration Generator"
arch=('any')
url="http://www.mythbuntu.org"
license=('GPL3')
depends=('python2' 'lirc')
makedepends=('python2')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('cd29343cc16536050f1f7c7c71d24cb9')



build() {

  cd $srcdir/$pkgname-$pkgver

  # install python package
  python2 setup.py install --root="$pkgdir" || return 1

}

package() {

  cd $srcdir/$pkgname-$pkgver
  
  # install man pages
  install -d -m755 ${pkgdir}/usr/share/man/man1
  install -m755 mythbuntu-lirc-generator.1 ${pkgdir}/usr/share/man/man1/

}
