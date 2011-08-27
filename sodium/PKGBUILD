# Contributor: Antonio Bonifati <http://monitor.deis.unical.it/ant>
pkgname=sodium
pkgver=1.6
pkgrel=1
pkgdesc="A program for arranging ions around biological macromolecules"
arch=('i686' 'x86_64')
url="http://www.ks.uiuc.edu/Development/MDTools/sodium/"
license=('custom')
makedepends=(gcc)
source=(http://www.ks.uiuc.edu/Development/MDTools/sodium/files/$pkgname-$pkgver.src.tar.gz LICENSE $pkgname.1)
md5sums=('0043b0bf22958f9a9df22ea401028665'
         '0fc3216f7361eb754af2524e16e48003'
	 '1216794bce2338547a5102f4e3eaa7b2')

build() {
  cd "$srcdir/$pkgname"

  gcc $CFLAGS -lm -o sodium sodium.c || return 1

  install -d $pkgdir/usr/{bin,share/{licenses/$pkgname,man/man1,$pkgname}}
  install -m0755 sodium $pkgdir/usr/bin/
  install -m0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
  install -m0644 $srcdir/$pkgname.1 $pkgdir/usr/share/man/man1
  install -m0644 *.config *.dqs *.pdb $pkgdir/usr/share/$pkgname/
}

# vim:set ts=2 sw=2 et:
