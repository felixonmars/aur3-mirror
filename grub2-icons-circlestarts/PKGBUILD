# Contributor: Frozen Fox <frozenfoxz@gmail.com>

pkgname=grub2-icons-circlestarts
pkgver=0.9
pkgrel=1
pkgdesc="More complete extra icon set for grub2-gfxmenu."
arch=('i686' 'x86_64')
license=('CCPL:by-nc-sa')
url="http://gnome-look.org/content/show.php/Circle+Starts?content=95970"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=circlestarts.install
makedepends=('gzip')
source=(CircleStarts-$pkgver.tar.gz::"http://gnome-look.org/CONTENT/content-files/95970-Circle%20Starts%20${pkgver}.tar.gz")
md5sums=('c56ddfa0d3e8a9424e4e401654ac0859')

build() {
  # Business as usual..
  cd ${srcdir}/big || return 1

  install -d ${pkgdir}/boot/grub/themes/ || return 1
  install -d ${pkgdir}/boot/grub/themes/icons/ || return 1
  for i in "${srcdir}/big/*" ; do
     install $i ${pkgdir}/boot/grub/themes/icons/ || return 1
  done

  cd ${pkgdir}/boot/grub/themes/icons || return 1
  rename ' ' '' * || return 1
  rename '.png' '_cs.png' * || return 1

}
