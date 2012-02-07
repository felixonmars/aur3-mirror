# Contributor: Guten <ywzhaifei@gmail.com>

pkgname=irssi-daemon-git
pkgver=20120207
pkgrel=1
pkgdesc="a daemon for irssi"
arch=("i686" "x86_64")
url="http://github.com/GutenYe/irssi-daemon"
license=("MIT-LICENSE")
groups=()
depends=("screen")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("etc/conf.d/irssi")
options=()
install=
changelog=
source=()
md5sums=() 

_gitroot="git://github.com/GutenYe/irssi-daemon.git"
_gitname="irssi-daemon"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi
    
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  cd $srcdir/$_gitname

  mkdir -p $pkgdir/etc/conf.d
  mkdir -p $pkgdir/etc/rc.d

  cp conf.irssi $pkgdir/etc/conf.d/irssi
  cp rc.irssi $pkgdir/etc/rc.d/irssi
}


# vim:set ts=2 sw=2 et:
