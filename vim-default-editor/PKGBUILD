# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=vim-default-editor
pkgver=1.0
pkgrel=1
pkgdesc="Set vim as the default editor in the shell"
arch=('any')
url="https://aur.archlinux.org/packages/vim-default-editor/"
license=('GPL')
depends=('vim')
source=($pkgname.sh)
noextract=($pkgname.sh)
md5sums=('d3b3e55d07d8de15802eedde0e5ffaa8')

package() {
  install -Dm755 $pkgname.sh $pkgdir/etc/profile.d/$pkgname.sh
}
