# Maintainer: Dustin Mays <dork.fish.wat@gmail.com>

pkgname=fbsplash-theme-arch-minimal
pkgver=0.1
pkgrel=3
pkgdesc="An Arch Linux-branded fbsplash theme, designed with KISS in mind."
arch=('i686' 'x86_64')
license="creative-commons"
url="http://www.kde-look.org/content/show.php?content=96452"
depends=('fbsplash')
optdepends=('kernel26fbcondecor: display background images on console framebuffer')
source=('arch-minimal-src.tar.gz')
md5sums=('36dbd8e2508ac9f24c20c91bcea2699d')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/etc/splash
  mv arch-minimal-src ${pkgdir}/etc/splash/arch-minimal
}
