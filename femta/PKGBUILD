# Maintainer: shacristo <shacristo at gmail dot com>

pkgname=femta
pkgver=0.7.1
pkgrel=1
pkgdesc="Easy to use truss analyzer"
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/${pkgname}/'
license=('GPLv3')
depends=('armadillo' 'gtkmm')
optdepends=()
makedepends=()
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}-src.tar.gz )
md5sums=('258f96c2ec51aaf8410e5840e50c413c')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

