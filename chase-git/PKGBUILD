# Contributor: Alexander Mityunin <avm-xandry_at_yandex_dot_ru>

pkgname=chase-git
pkgver=20100521
pkgrel=1
pkgdesc="CHakra and Arch SElf-updater. A KDED daemon used for automating updates"
arch=('i686' 'x86_64')
url="http://chakra-project.org/bbs/viewtopic.php?id=1303"
license=('GPL')
depends=('pacman' 'polkit-qt' 'aqpm2')
makedepends=('git' 'cmake>=2.6' 'automoc4')
provides=('chase')
conflicts=('chase')

_gitroot="git://git.chakra-project.org/tools/chase.git"
_gitname="chase"

build() {
  msg "Connecting to GIT server...."

  [ -d $_gitname ] && {
	cd $_gitname
	git pull origin
	cd ..

	msg "Local files have been updated."
  } || {
	git clone $_gitroot
  }

  msg "GIT checkout done or server timeout"

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."

  cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR="$pkgdir" install
}  
