pkgname=mint-themes-gtk3-git
pkgver=3.14
pkgrel=1
pkgdesc="The Mint-X GTK3 theme for Linux Mint (git version)"
arch=('any')
conflicts=('mint-x-theme')
url="https://github.com/linuxmint/mint-themes-gtk3/"
makedepends=('git')
license=('unknown')
source=('git+https://github.com/linuxmint/mint-themes-gtk3.git')
md5sums=('SKIP')
package() {
   cd $srcdir/mint-themes-gtk3
   cp -r usr/ $pkgdir/
}
