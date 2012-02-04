# Maintainer: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Xabz <xabz.2k5@gmail.com>
# Wallpaper: Weakhead <http://gnome-look.org/content/show.php/Elegant+Arch+(Brit+colors)?content=89916>

pkgname=grub2-theme-elegantarch
pkgver=0.1.1
pkgrel=2
pkgdesc="Elegant grub2-gfxmenu theme, Arch branded (1024x768)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://foro.archlinux.cl/viewtopic.php?id=12"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=elegantarch.install
makedepends=('gzip')
source=("http://hateanthem.dreamhosters.com/arch/build/elegantarch-${pkgver}.tar.gz")
md5sums=('6a47face6b546005657fcc72c34dda1a')

build() {
  cd ${srcdir}/elegantarch || return 1

  install -d ${pkgdir}/boot/grub/themes/
  install -d ${pkgdir}/boot/grub/themes/elegantarch/
  for i in ${srcdir}/elegantarch/* ; do
     install $i ${pkgdir}/boot/grub/themes/elegantarch/
  done
}