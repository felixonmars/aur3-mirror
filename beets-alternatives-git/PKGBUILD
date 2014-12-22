# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=beets-alternatives
pkgname=${_pkgname}-git
pkgver=0.r30.5700630
pkgrel=1
pkgdesc='Beets plugin to manage multiple versions of your audio files.'
arch=('any')
url="https://github.com/geigerzaehler/${_pkgname}"
license=('MIT')
depends=('python2' 'beets' 'python2-futures')
makedepends=('git')
provides=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/$_pkgname"
  touch test/__init__.py
  python2 setup.py test
}

package() {
  cd "$srcdir/$_pkgname"
  rm 'beetsplug/__init__.py'
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
