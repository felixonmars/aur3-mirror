# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=playdar-git
pkgver=20090921
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Playdar is a music content resolver service - run it on every computer you use, and you'll be able to listen to all the songs you would otherwise be able to find manually by searching though all your computers, hard disks, online services, and more"
url="http://www.playdar.org/"
license=('GPL3')
depends=('boost' 'taglib' 'sqlite3')
makedepends=('cmake')
source=(cstdio.patch)
md5sums=(8dfbd134886bd27937169f41218257cf)

_gitroot="git://github.com/RJ/playdar.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  git reset --hard HEAD
  git apply ../../cstdio.patch || return 1

  cmake . || return 1
	make || return 1
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
