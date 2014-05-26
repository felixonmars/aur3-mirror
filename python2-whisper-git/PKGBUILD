# Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
pkgname=python2-whisper-git
pkgver=0.9.12
pkgrel=1
pkgdesc="Fixed-size database that provides fast, reliable storage of numeric data over time."
arch=('any')
url="https://github.com/graphite-project/whisper"
license=('apache')
depends=('python2')
makedepends=('git' 'python2')
options=(!emptydirs)
source=('whisper::git+https://github.com/graphite-project/whisper.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/whisper"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
