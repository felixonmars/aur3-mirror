# Contributor: Your Name <your@mail.org>

pkgname=moblin-image-creator-2
pkgver=20090714
pkgrel=1
pkgdesc="Moblin image creation tools"
url="http://moblin.org/projects/moblin-image-creator-2"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git')
_gitroot="git://git.moblin.org/moblin-image-creator-2"
_gitname="moblin-image-creator-2"

build() {
  cd ${srcdir}
  msg "Connecting to git.moblin.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
} 
