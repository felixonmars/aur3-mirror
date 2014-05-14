# Maintainer: Kacper Żuk <kacper.b.zuk+aur@gmail.com>

_pkgname=python-spotify
pkgname=$_pkgname-git
provides=$_pkgname
pkgver=20140513
pkgrel=1
pkgdesc="pyspotify provides a Python interface to Spotify’s online music streaming service (python3 package)"
arch=(any)
url="http://pyspotify.mopidy.com/en/latest/"
license=('Apache')
makedepends=('python-setuptools' 'git')
depends=('python' 'libspotify' 'python-cffi')
options=(!emptydirs)
source=("$_pkgname"::git+https://github.com/mopidy/pyspotify.git)
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
