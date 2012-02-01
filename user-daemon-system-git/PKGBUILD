# Contributor: Guten <ywzhaifei@gmail.com>

pkgname=user-daemon-system-git
pkgver=20120201  
pkgrel=1
pkgdesc="A User based Daemon System for ZSH"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/user-daemon-system"
license=("MIT-LICENSE")
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("home/$USER/etc/rc.conf")
options=()
changelog=

_gitroot="git://github.com/GutenYe/user-daemon-system"
_gitname="user-daemon-system"

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

  mkdir -p $pkgdir/home/$USER
  cp -r etc $pkgdir/home/$USER/

  mkdir -p $pkgdir/home/$USER/var/run/daemons
  mkdir -p $pkgdir/home/$USER/var/log
  mkdir -p $pkgdir/home/$USER/etc/conf.d
  mkdir -p $pkgdir/home/$USER/etc/rc.d/functions.d

  chown $USER:$USER -R $pkgdir
}


# vim:set ts=2 sw=2 et:
