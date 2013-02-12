# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=slim-theme-archlinux-simplyblack-dual
pkgver=1.1
pkgrel=2
pkgdesc='Slim theme archlinux simplyblack for dual monitors'
url='https://github.com/bentglasstube/archlinux-simplyblack-dual'
license=('CCPL:cc-by-sa')
arch=('any')
depends=('slim')
install=archlinux-simplyblack-dual.install
source=('https://github.com/bentglasstube/archlinux-simplyblack-dual/raw/0b5463d5b7c92ce23d480e6166df6a0c0de2e0c1/archlinux-simplyblack-dual.tar.gz')
md5sums=('9d34bd4fb804733a23338d692211aeee')

build() {
  cd $srcdir

  install -m 644 -D background.png ${pkgdir}/usr/share/slim/themes/archlinux-simplyblack-dual/background.png
  install -m 644 -D panel.png      ${pkgdir}/usr/share/slim/themes/archlinux-simplyblack-dual/panel.png
  install -m 644 -D slim.theme     ${pkgdir}/usr/share/slim/themes/archlinux-simplyblack-dual/slim.theme
}
