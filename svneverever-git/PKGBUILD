# Contributor: mosra <mosra@centrum.cz>
pkgname=svneverever-git
pkgver=v1.2.2.r0.g330b58e
pkgrel=1
pkgdesc="Collects path entries across SVN history (Git build)"
arch=('any')
url="http://blog.hartwork.org/?p=763"
license=('GPLv3')
groups=()
depends=('python2' 'python2-pysvn')
makedepends=('git')
source=("git+https://github.com/hartwork/svneverever.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
