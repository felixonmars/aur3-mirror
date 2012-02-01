# Contributor: Guten <ywzhaifei@gmail.com>

pkgname=user-mpd-git
pkgver=20120201  
pkgrel=1
pkgdesc="an mpd user daemon. READ https://github.com/GutenYe/user-daemon-system FIRST"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/user-mpd"
license=("MIT-LICENSE")
groups=()
depends=("user-daemon-system-git")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=()
md5sums=()

_gitroot="git://github.com/GutenYe/user-mpd"
_gitname="mpd"

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
  p_root=$pkgdir/home/$USER
  cd $srcdir/$_gitname

  mkdir -p $p_root/etc/rc.d
  cp rc.mpd $P_root/etc/rc.d/mpd

  chown $USER:$USER -R $pkgdir
}


# vim:set ts=2 sw=2 et:
