# Maintainer: Marcin
pkgname=kdeplasma-applets-wattson
pkgver=1.0beta
pkgrel=1
pkgdesc="This is a plasmoid for viewing power used by laptop. Now configurable"
url="http://kde-look.org/content/show.php/Wattson?content=126981"
arch=('x86_64' 'i686')
license=('GPL')
#depends=('php' 'mysql')
#optdepends=('')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://dl.dropbox.com/u/5225087/wattson-upower.tar.xz")
md5sums=('e12db63aefffe72c2b8531c22eb5a213')
 
build() {
  #cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p wattson-upower/build
  cd wattson-upower/build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release ../
   make || return 1

    make DESTDIR=${pkgdir} install || return 1
}

