# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=selecta-git
pkgver=20140831
pkgrel=1
pkgdesc="A fuzzy text selector for files and anything else you need to select"
arch=('any')
depends=('ruby')
makedepends=('git')
url="https://github.com/garybernhardt/selecta"
license=('MIT')
source=(git+https://github.com/garybernhardt/selecta)
sha256sums=('SKIP')
provides=('selecta')
conflicts=('selecta')
install=selecta.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/selecta/README.md"
  install -Dm 644 demo.gif "$pkgdir/usr/share/doc/selecta/demo.gif"

  msg 'Installing...'
  install -Dm 755 selecta "$pkgdir/usr/bin/selecta"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
