# Contributor: danitool
pkgname=libgoom2
pkgver=2k4
pkgrel=1
pkgdesc="A cool visual effects library that runs on almost every multimedia players like vlc"
arch=('i686' 'x86_64')
url="http://www.fovea.cc/?page=details_produits&id=goom"
license=('LGPL')
source=("http://ovh.dl.sourceforge.net/project/goom/goom2k4/0/goom-2k4-0-src.tar.gz")
md5sums=('8100dd07e0c6784fdf079eeaa53a5c7f')

build() {
  cd "$srcdir/goom2k4-0"

  ./configure --prefix=/usr

  make || return 1

  make  install DESTDIR=${pkgdir}

}
