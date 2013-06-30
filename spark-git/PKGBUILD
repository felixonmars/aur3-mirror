_pkgname=spark
pkgname=spark-git
pkgver=20121219
pkgrel=1
pkgdesc="Generates sparklines for a set of data. (git version)"
url="http://zachholman.com/spark/"
license=('MIT')
depends=()
makedepends=('git')
options=()
arch=('any')
sha1sums=('SKIP')
source=("git+https://github.com/holman/spark.git")

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd "$srcdir/$_pkgname"
  install -D spark "${pkgdir}/usr/bin/spark"
  install -D "README.md" "${pkgdir}/usr/share/doc/spark/README.md"
}
