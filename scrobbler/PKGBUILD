# Maintainer: Никола Вукосављевић <hauzer@gmx.com>

pkgname=scrobbler
_pypipkgname=${pkgname}h
_pkgver=1.1.2-1
pkgver=1.1.2_1
pkgrel=2
pkgdesc='A command-line Last.fm scrobbler and a now-playing status updater.'
arch=('any')
url='https://bitbucket.org/hauzer/${pkgname}/'
license=('GPL')
depends=('python' 'python-appdirs' 'python-docopt' 'python-lfm')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/${_pypipkgname}/${_pypipkgname}-${_pkgver}.tar.gz")
sha512sums=('cfb7a71ec6703fb803f41bdf541e8293e21ca742f60589fca63531a482ef53a7166f9485a3eb4360f74d4d8e3031899856ababd25ca23354e1b72aae24b070a6')

package() {
  cd "${srcdir}/${_pypipkgname}-${_pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

