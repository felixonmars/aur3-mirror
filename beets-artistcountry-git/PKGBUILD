# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=beets-artistcountry
pkgname=${_pkgname}-git
pkgver=0.1.1
pkgrel=1
pkgdesc='Beets plugin to retrieve the country of an artist from MusicBrainz.'
arch=('any')
url="https://github.com/agrausem/${_pkgname}"
license=('unknown')
depends=('python2' 'beets')
makedepends=('git')
provides=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed -r 's/-/.r/; s/-/./' 
}

package() {
  cd "$srcdir/$_pkgname"
  rm 'beetsplug/__init__.py'
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst "$pkgdir/usr/share/doc/${_pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
