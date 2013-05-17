# Contributor: chromatic6
pkgname=smaragd-git
pkgver=20130504
pkgrel=1
pkgdesc="KWin plugin to support Emerald themes in KDE."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Smaragd+(Emerald+for+KDE)?content=125162"
license=('GPL2')
depends=('kdebase-workspace' 'qt4')
makedepends=('cmake' 'automoc4' 'git' 'cairo')
conflicts=('smaragd')
install=smaragd.install

_gitroot="git://anongit.kde.org/smaragd"
_gitname="smaragd"

build() {
cd $srcdir
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
	
cd $_gitname
rm -rf build && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .. || return 1
make || return 1
}
package(){
  cd $_gitname/build
  make DESTDIR=${pkgdir} install || return 1
}