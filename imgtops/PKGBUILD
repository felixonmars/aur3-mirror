# Contributor: Leonid.I <lisaev at indiana dot edu>

pkgname=imgtops
pkgver=1.0
pkgrel=1
pkgdesc="Bitmap image to (E)PS converter"
arch=('i686' 'x86_64')
url="http://imgtops.sourceforge.net/"
license=('custom')
depends=('python2' 'python-imaging' 'ghostscript')
makedepends=('python2' 'gcc')
source=(http://downloads.sourceforge.net/project/imgtops/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz setup.py.patch)
sha1sums=('b645f58ead1b60a76648dbae8dd2b026aa501248'
          '5ba790cdfe2808eccda59c389d80684ad5de8fab')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ${srcdir}/setup.py.patch
  python2 setup.py build
  python2 setup.py install --root $pkgdir
  install -dm755 $pkgdir/usr/share
  mv $pkgdir/usr/man $pkgdir/usr/share
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
