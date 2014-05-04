# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-pagekite
pkgname=python2-pagekite
_pkgname=pagekite
pkgver=0.5.6d
pkgrel=5
pkgdesc='Python implementation of the PageKite remote front-end protocols.'
arch=('any')
url='http://pagekite.org'
license=('GPL')
depends=('python2' 'python2-setuptools' 'python2-socksipychain')
provides=('pypagekite')
conflicts=('pagekite')
options=(!emptydirs zipman)
source=("https://pagekite.net/pk/src/$_pkgname-$pkgver.tar.gz")
md5sums=('2e1982c3fc9dc9461e7b1e24ffffe468')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # Man pages
  cd doc
  for manpage in *.1
  do
    install -m 644 -D $manpage $pkgdir/usr/share/man/man1/$manpage
  done

}

# vim:set ts=2 sw=2 et:
