# Maintainer: Éric Gillet <twiked@linuxw.info> 

pkgname=python-tpb-git
pkgver=v1.3.0.r1.g763e05b
pkgrel=1
pkgdesc="Unofficial Python API for ThePirateBay"
arch=('any')
url="https://github.com/karan/TPB"
license=('MIT')
depends=('python' 'python-lxml' 'python-dateutil' 'python-beautifulsoup4' 'python-purl')
makedepends=('git')
conflicts=('python-tpb')
provides=('python-tpb')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/karan/TPB')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
