# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>

pkgname=fuzzy-window-switcher-git
pkgver=1.0.0.r6.g03050c7
pkgrel=1
pkgdesc="A fuzzy window switcher inspired by Sublime Text's Ctrl+P."
arch=('any')
url="https://github.com/XCMer/fuzzy-window-switcher"
license=('GPL')
depends=('gtk3' 'libkeybinder3' 'python' 'libwnck3')
makedepends=('git')
source=(${pkgname%-git}::"git://github.com/XCMer/fuzzy-window-switcher.git")
md5sums=('SKIP')

pkgver(){
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd ${pkgname%-git}
  install -Dm755 fuzzy-windows "$pkgdir"/usr/bin/fuzzy-windows
  install -Dm644 docs/docs.md "$pkgdir"/usr/share/doc/${pkgname%-git}/README.md
}
