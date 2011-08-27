# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=panache-llibs-git
pkgver=20100212
pkgrel=1
pkgdesc="Libraries for the Panache Desktop Environment"
arch=('i686' 'x86_64')
url="http://www.logram-project.org/"
license=('GPL')
depends=('qt' 'phonon')
makedepends=('git')
provides=()
source=('phonon')
md5sums=('d93494736281a8c5ab829c1b7c611bf8')

_gitroot="git://gitorious.org/logram/desktop.git"
_gitname="desktop"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # because <phonon> does not exists
  cp $startdir/phonon $srcdir/desktop/llibs/plugins/panache/desktop/ghetto
  sed s/\<phonon\>/\"phonon\"/ < $srcdir/desktop/llibs/plugins/panache/desktop/ghetto/ghetto.h > $srcdir/desktop/llibs/plugins/panache/desktop/ghetto/ghetto.h.new
  cp $srcdir/desktop/llibs/plugins/panache/desktop/ghetto/ghetto.h.new $srcdir/desktop/llibs/plugins/panache/desktop/ghetto/ghetto.h

  cd $_gitname
  cd llibs

  ## clear tmp
  make clean

  #
  # BUILD HERE
  #

  make || return 1
  make DESTDIR="$pkgdir" install || return 1

}
