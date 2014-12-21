# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=beets-copyartifacts
pkgname=${_pkgname}-git
pkgver=1.0.beta.2.r4.g3ee264d
pkgrel=1
pkgdesc='A beets plugin that moves non-music files during the import process.'
arch=('any')
url='https://github.com/sbarakat/beets-copyartifacts'
license=('MIT')
depends=('python2' 'beets')
makedepends=('git')
provides=("$_pkgname")
source=('git+https://github.com/sbarakat/beets-copyartifacts.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  rm 'beetsplug/__init__.py'
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/${_pkgname}/MIT-LICENSE.txt"
}

check() {
  cd "$srcdir/$_pkgname"
  python2 setup.py test
}

# vim:set ts=2 sw=2 et:
