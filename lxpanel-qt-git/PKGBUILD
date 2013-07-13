# Maintainer: Diego Principe <cdprincipe@at@gmail@dot@com>

_pkgname=lxpanel-qt
pkgname=$_pkgname-git
pkgver=1a31434_42
pkgrel=1
pkgdesc="The Qt porting of lxpanel"
arch=('i686' 'x86_64')
url="http://www.lxde.org"
license=('GPL3')

depends=('qt4' 
         'pcmanfm-qt-git' 
         'libfm-git' 
         'libgtop' 
         'menu-cache' 
         'glib' 
         'libxdamage' 
         'libxcomposite' 
         'libxrender')
makedepends=('git')
source=(git+git://lxde.git.sourceforge.net/gitroot/lxde/lxpanel-qt)
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git describe --always | sed 's|-|.|g')_$(git rev-list --count HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
