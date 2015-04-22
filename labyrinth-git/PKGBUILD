# Maintainer: Todor Imreorov blurymind@gmail.com

pkgname=labyrinth-git
pkgver=master
pkgrel=1
pkgdesc="A lightweight mind-mapping tool with support for image import and drawing - development version"
arch=('any')
url="http://code.google.com/p/labyrinth/"
license=('GPL')
depends=('gnome-python' 'gnome-desktop2' 'python2-numpy')
makedepends=('gnome-common' 'intltool')
conflicts=('labyrinth')
install=$pkgname.install
source=('git+https://github.com/labyrinth-team/labyrinth.git')
md5sums=(SKIP)

pkgver() {
   cd "${srcdir}/labyrinth"
   ver=$(git describe --abbrev=0 | sed -e 's/[^.0-9]//g')
   count=$(git rev-list --count HEAD)
   commit=$(git rev-parse --short HEAD)
   echo $ver.r$count.$commit
}

package() {
  cd "${srcdir}/labyrinth"
  python2.7 setup.py install --root="${pkgdir}"
  export DESTDIR="${pkgdir}"
  ./install_data_files.sh 
}

