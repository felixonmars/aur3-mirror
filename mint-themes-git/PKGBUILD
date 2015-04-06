pkgname=mint-themes-git
pkgver=1.4.0
pkgrel=1
pkgdesc="The Mint-X GTK2 theme for Linux Mint (git version)"
arch=('any')
conflicts=('mint-x-theme')
url="https://github.com/linuxmint/mint-themes/"
license=('unknown')
makedepends=('git')
source=('git+https://github.com/linuxmint/mint-themes.git')
md5sums=('SKIP')
package() {
   cd $srcdir/mint-themes
   cp -r usr/ $pkgdir/
}

