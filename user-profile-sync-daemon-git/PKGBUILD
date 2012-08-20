# Contributor: Guten <ywzhaifei at gmail dot com>

pkgname=user-profile-sync-daemon-git
pkgver=20120313 
pkgrel=2
pkgdesc="sync browser profiles to tmpfs. READ https://github.com/GutenYe/user-daemon-system FIRST"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/user-profile-sync"
license=("MIT-LICENSE")
groups=()
depends=("user-daemon-system-git" "rsync")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("home/$USER/etc/conf.d/profile-sync")
options=()
changelog=
md5sum=()

_gitroot="git://github.com/GutenYe/user-profile-sync.git"
_gitname="user-profile-sync"

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
  cd ${srcdir}/${_gitname}

	install -Dm755 rc.profile-sync $p_root/etc/rc.d/profile-sync
  install -Dm664 conf.profile-sync $p_root/etc/conf.d/profile-sync

  chown $USER:$USER -R $pkgdir
}

# vim:set ts=2 sw=2 et:
