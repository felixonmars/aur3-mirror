# Maintainer: Eric Liu <eric@hnws.me>
pkgname=python2-thumbor
relname=thumbor
pkgver=5.0.3
pkgrel=2
pkgdesc="thumbor is an open-source photo thumbnail service by globo.com"
arch=('any')
url="https://github.com/thumbor/thumbor"
license=('MIT')
groups=()
depends=('python2' 'mongodb' 'redis' 'opencv' 'python2-futures' 'python2-libthumbor' 'python2-statsd' 'python2-pexif' 'python2-python-magic' 'python2-derpconf' 'python2-pycurl' 'python2-crypto' 'python2-tornado' 'python2-six')
makedepends=()
provides=('python2-thumbor')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/thumbor/thumbor/archive/$pkgver.tar.gz")
md5sums=('86a62b90caeaf1b9853400bb91345d57')

package() {
  tar xzf "$pkgver.tar.gz"
  cd "$srcdir/$relname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
