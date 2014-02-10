# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org>
# Contributor: flu

pkgname=mopidy-gmusic
_pypiname=Mopidy-GMusic
pkgver=0.3.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from Google Play Music"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
 'mopidy>=0.16'
 'python2-gmusicapi'
 'python2-distribute')
makedepends=('python2')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('5de4c7cc543080c5e9e547a91d1946f9')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
