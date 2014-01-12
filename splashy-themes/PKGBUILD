# Maintainer: carstene1ns
# Contributor: Lexiw <llexiw@gmail.com>
# Contributor: SiD/sidious <miste7@web.de>
# Contributor: Jeremy Sands <cto@jeremysands.com>
# Contributor: Stefano Gioffre' <grossomalpelo at gmail.com>
# Source: http://www.jeremysands.com/archlinux/splashy-themes-0.4.tar.gz

pkgname="splashy-themes"
pkgver="0.4"
pkgrel=1
pkgdesc="Arch Linux inspired Splashy Themes"
arch=("any")
url="http://bbs.archlinux.org/viewtopic.php?id=48978"
license=("custom: CC")
depends=("splashy" "archlinux-wallpaper")
conflicts=("splashy-theme-darch")
source=("https://dl.dropboxusercontent.com/u/236463991/splashy-themes/splashy-themes-0.4.tar.gz")
md5sums=("069742022a3e8b2fe127bf4fbc8e22b5")
sha512sums=('a81228be8619d26f42dc7a7c86c2151f8d82a7bdfe308947b1b775a2a82bb0884083a8fa1180ec727f55856e02f39a5f0b7f56627034c3700d9a0d9a12aaf170')

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir/" ./install.sh
}
