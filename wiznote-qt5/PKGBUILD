# $Id: PKGBUILD 101247 2014-05-13 11:19:17Z ferren $
# Maintainer: Ferren Liu <ferrenliu@gmail.com>
# Contributor: Albert.Zhou <albert.zhou@wiz.cn>

pkgname=wiznote-qt5
pkgver=2.1.6
pkgrel=1
pkgdesc="Opensource cross-platform cloud based note-taking client"
arch=('i686' 'x86_64')
url="http://www.wiznote.com"
license=('GPL3' 'custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'qt5-base' 'qt5-webkit') # indirect: qt5-declarative qt5-sensors zlib glic gcc-libs
makedepends=('cmake' 'qt5-tools' 'git')
install=wiznote-qt5.install
patch=qt5-pushbutton.patch
_wiznote_project_name="WizQTClient"
source=("git+https://github.com/WizTeam/${_wiznote_project_name}.git#branch=v$pkgver")
md5sums=('SKIP')

build() {
    cd $_wiznote_project_name
    patch -Np0 -i ../../qt5-pushbutton.patch 
    cmake -DWIZNOTE_USE_QT5=YES -DCMAKE_INSTALL_PREFIX=/usr/ .
	make
}

package() {
	cd $_wiznote_project_name
	make DESTDIR="$pkgdir/" install
}
