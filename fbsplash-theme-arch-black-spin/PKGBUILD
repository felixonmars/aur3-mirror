# Maintainer: Fabio Comuni <fabrix.xm@gmail.com>

pkgname=fbsplash-theme-arch-black-spin
pkgver=1.0
pkgrel=3
pkgdesc="An Arch Linux fbsplash theme with spinning 3d logo. Based on arch-black 1.2 theme by PirateJonno"
arch=('i686' 'x86_64')
license="creative-commons"
url="http://kde-look.org/content/show.php?content=117705"
depends=('fbsplash')
optdepends=('kernel26fbcondecor: display background images on console framebuffer')
source=('http://kirgroup.com/archlinux/arch-black-spin-src.tar.gz')
md5sums=('1c76c305010527ac9efb67749af43dd2')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/etc/splash
  mv arch-black-spin-src ${pkgdir}/etc/splash/arch-black-spin
}
