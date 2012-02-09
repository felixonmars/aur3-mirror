# Contributor: Guten <ywzhaifei@gmail.com>

pkgname=user-aria2-daemon-git
pkgver=20120209  
pkgrel=1
pkgdesc="an aria2 user daemon. READ https://github.com/GutenYe/user-daemon-system FIRST"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/user-aria2-daemon"
license=("MIT-LICENSE")
groups=()
depends=("user-daemon-system-git")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("home/$USER/etc/conf.d/aria2")
options=()
changelog=
source=()
md5sums=()

_gitroot="git://github.com/GutenYe/user-aria2-daemon.git"
_gitname="aria2"

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

  mkdir -p $p_root/etc/conf.d
  mkdir -p $p_root/etc/rc.d
  mkdir -p $p_root/var/cache/aria2

  cp rc.aria2 $p_root/etc/rc.d/aria2
  cp conf.aria2 $p_root/etc/conf.d/aria2

  chown $USER:$USER -R $pkgdir
}


# vim:set ts=2 sw=2 et:
