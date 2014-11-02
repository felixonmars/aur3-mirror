# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
# Contributor: Gently <toddrpartridge@gmail.com>

pkgname=nano-default-editor
pkgver=1.0
pkgrel=1
pkgdesc="Set nano as the default editor in the shell"
arch=('any')
url="https://aur.archlinux.org/packages/nano-default-editor/"
license=('GPL')
depends=('nano')
source=($pkgname.sh)
noextract=($pkgname.sh)
md5sums=('51e35d540fbe79b06f40f8285d80f87d')

package() {
  install -Dm755 $pkgname.sh $pkgdir/etc/profile.d/$pkgname.sh
}
