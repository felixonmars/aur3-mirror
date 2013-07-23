pkgname=cuwo-scripts-git
pkgver=5
pkgrel=1
pkgdesc="Scripts created by the community for cuwo, the open Cube World server"
arch=(any)
license=("GPLv3")
depends=(cuwo)
makedepends=(python2 git)
url="https://github.com/matpow2/cuwo-scripts"
source=("${pkgname%-*}::git+https://github.com/matpow2/cuwo-scripts.git")
backup=("srv/cuwo/config/web.py")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/${pkgname%-*}"
  echo $(git rev-list --count master)
}

package() {
  cd "${srcdir}/${pkgname%-*}/"
  find . -name '*.py' -o -name '*.html' -o -name '*.css' -o -name '*.png' -o -name '*.js' |
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/srv/cuwo/"{}
  python2 -m compileall "$pkgdir/srv/cuwo"
  install -m644 "README.md" "$pkgdir/srv/cuwo/README-scripts.md"
  install -Dm644 "COPYING.txt" "$pkgdir/usr/share/licenses/cuwo-scripts/COPYING.txt"
}
