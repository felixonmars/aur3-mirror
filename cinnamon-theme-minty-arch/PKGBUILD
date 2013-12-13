# Contributor: Robert Orzanna <orschiro@gmail.com>

pkgname=cinnamon-theme-minty-arch
pkgver=2.2
pkgrel=7
pkgdesc="Cinnamon theme with some flavour of Linux Mint with blue Arch Linux colours"
url="http://cinnamon-spices.linuxmint.com/themes/view/25"
license=('GPL')
arch=('any')
depends=('cinnamon')
source=("https://github.com/orschiro/pkgbuild/blob/master/cinnamon-theme-minty-arch/cinnamon-theme-minty-arch-2-2-6.zip?raw=true")
md5sums=('44241b8bc5f6aa139c5b7d18ff37d346')

package() {
  find MintyArch/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
