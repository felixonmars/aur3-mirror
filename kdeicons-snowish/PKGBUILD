# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=kdeicons-snowish
pkgver=1.3
pkgrel=3
pkgdesc="KDE port of the Snowish icon theme from GNOME"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=42905"
license=('GPL')
makedepends=('tar' 'bzip2' 'imagemagick')
source=(http://www.arnorehn.de/var/SnowIsh-kde-${pkgver}_build.tar.bz2)
md5sums=('6ca570cb19dce2615aca9843db53b7c0')

build() {
  cd ${startdir}/src/SnowIsh-kde-${pkgver}_build
  sh buildset

  mkdir -p ${startdir}/pkg/usr/share/icons
  tar xjf SnowIsh-${pkgver}.tar.bz2 -C ${startdir}/pkg/usr/share/icons

  cd ${startdir}/pkg/usr/share/icons
  mv SnowIsh-${pkgver} ${startdir}/pkg/usr/share/icons/snowish
}
