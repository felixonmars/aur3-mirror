pkgname=plasmoid-eventlist-git
pkgver=20110328
pkgrel=1
pkgdesc="This is a plasmoid to show the events from Akonadi resources (KOrganizer, Birthdays etc.)."
arch=('i686' 'x86_64')
url="http://github.com/geflei/plasmoid-eventlist"
license=('GPL')
depends=('kdebase-workspace>=4.3.0' 'boost-libs')
makedepends=('gcc' 'cmake' 'automoc4' 'boost')
provides=(plasmoid-eventlist)
conflicts=(plasmoid-eventlist)
source=()
md5sums=()

_gitroot="http://github.com/geflei/plasmoid-eventlist.git"
_gitname="master"


build() {

  cd $srcdir

  if [[ -d $_gitname ]]; then
  (cd $_gitname && git pull origin)
  else
  git clone $_gitroot $_gitname
  fi

  cd $_gitname

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
  make || return 1
  make DESTDIR=$pkgdir install
}
