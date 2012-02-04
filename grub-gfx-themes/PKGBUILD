# Contributor: Jeremy Sands cto@jeremysands.com
pkgname=grub-gfx-themes
pkgver=0.1
pkgrel=1
pkgdesc="A collection of grub graphical boot themes."
arch=('i686' 'x86_64')
url="http://www.jeremysands.com/archlinux/"
license=('GPL')
depends=('grub-gfx')
source=(http://www.jeremysands.com/archlinux/grub-gfx-themes.tar.gz)
md5sums=('b7a411f3391028ed92cd9bce3065011a')
install=${pkgname}.install

build() {
  cd "$startdir"/pkg/
  mkdir -p usr/share/grub-gfx-themes

  cd "$startdir"/src/
  cp * "$startdir"/pkg/usr/share/grub-gfx-themes
}

# vim:set ts=2 sw=2 et:
