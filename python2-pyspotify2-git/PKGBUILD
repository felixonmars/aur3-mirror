# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=python2-pyspotify2-git
_pkgname=pyspotify
pkgver=v2.0.0b3.r3.g45de546
pkgrel=1
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python2' 'libspotify' 'python2-cffi' 'python2-setuptools')
conflicts=('pyspotify-git' 'pyspotify')
provides=('pyspotify')
makedepends=('git')
source=("git+https://github.com/mopidy/pyspotify.git#branch=v2.x/master")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

