# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=slim-theme-archlinux-simplyblack-dual
pkgver=1.0
pkgrel=1
pkgdesc='Slim theme archlinux simplyblack for dual monitors'
url='https://github.com/bentglasstube/archlinux-simplyblack-dual'
license=('CCPL:cc-by-sa')
arch=('any')
depends=('slim')
install=archlinux-simplyblack-dual.install
source=('https://github.com/bentglasstube/archlinux-simplyblack-dual/raw/master/archlinux-simplyblack-dual.tar.gz')
md5sums=('abe17c694d3fc97f5dd38603c6879b9d')

build() {
  cd $srcdir

  install -m 644 -D background.png ${pkgdir}/usr/share/slim/themes/archlinux-simplyblack-dual/background.png
  install -m 644 -D panel.png      ${pkgdir}/usr/share/slim/themes/archlinux-simplyblack-dual/panel.png
  install -m 644 -D slim.theme     ${pkgdir}/usr/share/slim/themes/archlinux-simplyblack-dual/slim.theme
}
