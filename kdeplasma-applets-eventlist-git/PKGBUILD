pkgname=kdeplasma-applets-eventlist-git
pkgver=20140806
pkgrel=1
pkgdesc="This is a plasmoid to show the events from Akonadi resources (KOrganizer, Birthdays etc.)."
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/pim/plasmoid-eventlist"
license=('GPL')
depends=('kdebase-workspace>=4.3.0' 'boost-libs')
makedepends=('gcc' 'cmake' 'automoc4' 'boost')
provides=(kdeplasma-applets-eventlist plasmoid-eventlist-git)
conflicts=(kdeplasma-applets-eventlist plasmoid-eventlist-git)
source=()
md5sums=()

_gitroot="git://anongit.kde.org/plasmoid-eventlist"


build() {

  cd $srcdir

  if [[ -d $_gitname ]]; then
  (cd $_gitname && git pull origin)
  else
  git clone $_gitroot
  fi

  cd plasmoid-eventlist

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release ../
  make || return 1
  make DESTDIR=$pkgdir install
}
