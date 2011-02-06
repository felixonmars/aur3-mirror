# Contributor: Erik Johnson <palehose at gmail dot com>
pkgname=plasma-theme-elegance-kdeartwork-4.5
pkgver=1.0
pkgrel=2
pkgdesc="An elegant theme for plasma (kdeartwork 4.5 release)"
arch=('any')
url="http://kde.org/"
license=('LGPL')
depends=('kdebase-workspace')
source=("http://ompldr.org/vNzZmNg/${pkgname}.tar.bz2")
md5sums=('56efbc7b10b863e3e42efcd986d70751')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/apps/desktoptheme
  cp -r Elegance ${pkgdir}/usr/share/apps/desktoptheme/
}

