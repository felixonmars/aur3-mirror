# Contributor: Ilya Petrov <ilya.muromec@gmail.com>

pkgname=qputusb
pkgver=20090816
pkgrel=4
pkgdesc="Simple flash utility for Motorola EZX Gen2 phones"
arch=('i686' 'x86_64')
url="http://github.com/muromec/putusb/tree/master"
license=('GPL')
groups=()
depends=('putusb' 'pyqt4')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(50-ezx-flash.rules)
noextract=()
md5sums=('39cb4ed67ee89d57e97f9f1e6ca26eb6')

_gitroot="git://github.com/muromec/putusb.git"
_gitname="putusb"

build() {
  msg "Connecting to GIT server...."
 
  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done"

  msg "Downloading gen-blob"

  cd $startdir/src/$_gitname

  [ -e gen-blob ] && rm gen-blob
  wget http://people.openezx.org/muromec/putusb/gen-blob

  install -d $startdir/pkg/usr/bin || return 1
  install -m 755 qputusb.py $startdir/pkg/usr/bin/qputusb || return 1

  install -d $startdir/pkg/lib/firmware/ezx/ || return 1
  install gen-blob $startdir/pkg/lib/firmware/ezx/gen-blob || return 1

  install -d $startdir/pkg/etc/udev/rules.d || return 1
  install ../50-ezx-flash.rules $startdir/pkg/etc/udev/rules.d/50-ezx-flash.rules || return 1

  rm gen-blob
 
}
