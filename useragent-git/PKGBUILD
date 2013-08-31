# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Sebastian neef <aur [at] gehaxelt dot in>

pkgname=useragent-git
pkgver=5.24fcd99
epoch=1
pkgrel=1
pkgdesc="Writes different useragents to stdout. Useful in combination with curl"
arch=('any')
url="https://github.com/gehaxelt/SH-UserAgent"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/gehaxelt/SH-UserAgent")
md5sums=('SKIP')

pkgver() {
  cd SH-UserAgent
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/SH-UserAgent"
  install -Dm755 useragent.sh "$pkgdir/usr/bin/useragent"
  install -Dm644 README.md "$pkgdir/usr/share/doc/useragent"
}
