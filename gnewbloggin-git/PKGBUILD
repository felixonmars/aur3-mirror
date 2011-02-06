# Mainteiner: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=gnewbloggin-git
pkgver=20100721
pkgrel=1
pkgdesc="A bash client for gNewBook"
url="http://gitorious.org/gnewbloggin"
license=('GPL')
arch=('i686' 'x86_64')
depends=('curl')
makedepends=('git')

_gitroot='git://gitorious.org/gnewbloggin/gnewbloggin.git'
_gitname='gnewbloggin'

build() {

      cd $srcdir

      msg "Connecting to github.com GIT server...."
  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi
      msg "GIT checkout done or server timeout"

      msg "Starting make..."

  cd ${srcdir}/${_gitname}

  make DESTDIR=$pkgdir install || return 1

}
