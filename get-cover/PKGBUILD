# Maintainer: DirectorX <directorx@ktzr.ml>

pkgname=get-cover
_gitname=get-cover
pkgver=1.2
pkgrel=1
pkgdesc="A simple album cover art fetcher"
arch=(any)
url="https://github.com/DirectorX/get-cover"
license=('GPL3')
depends=('python2')
makedepends=('git')
source=("git+https://github.com/DirectorX/get-cover.git#tag=v$pkgver")
md5sums=("SKIP")

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 get-cover.py "$pkgdir/usr/bin/get-cover.py"
  ln -s get-cover.py "$pkgdir/usr/bin/get-cover"
}
