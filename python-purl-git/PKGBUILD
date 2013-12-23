# Maintainer: Éric Gillet <twiked@linuxw.info> 

pkgname=python-purl-git
pkgver=0.4.1.r56.g99ddb52
pkgrel=1
pkgdesc="A simple, immutable URL class with a clean API for interrogation and manipulation."
arch=('any')
url="https://github.com/codeinthehole/purl/"
license=('MIT')
depends=('python' 'python-six')
makedepends=('git' 'python-setuptools')
conflicts=('python-purl')
provides=('python-purl')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/codeinthehole/purl')
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
