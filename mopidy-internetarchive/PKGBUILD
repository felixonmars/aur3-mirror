# Maintainer: flu

pkgname=mopidy-internetarchive
_pypiname=Mopidy-InternetArchive
pkgver=0.5.0
pkgrel=1
pkgdesc="Mopidy extension for playing music and audio from the Internet Archive"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.18'
	'python2-setuptools'
)
makedepends=('python2')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('a8aaa4e50052435ce96d6339bd0fb648')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
