# Maintainer: Éric Gillet <twiked@linuxw.info> 

pkgname=sxxexx-git
pkgver=v0.2.r1.g2462988
pkgrel=1
pkgdesc="A command line tool to search (and download) series from the Piracy Bay."
arch=('any')
url="https://github.com/nicolargo/sxxexx"
license=('MIT')
depends=('python' 'python-tpb')
optdepends=('python-transmissionrpc')
makedepends=('git')
conflicts=('sxxexx')
provides=('sxxexx')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/nicolargo/sxxexx.git')
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
