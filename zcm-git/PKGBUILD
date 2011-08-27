# Contributor: Guten <ywzhaifei@gmail.com>

pkgname=zcm-git
pkgver=20110804  # svn auto added
pkgrel=1
pkgdesc="zcm is a ZSH Configuration Manager"
arch=("i686" "x86_64")
url="http://zcm.heroku.com"
license=("MIT-LICENSE")
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
md5sums=() 

_gitroot="git://github.com/zcm/zcm.git"
_gitname="zcm"

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

  # msg "Starting make..."
	# make
}

package() {
  cd ${srcdir}/${_gitname}

  #
  # install
  #
  mkdir -p $pkgdir/usr/bin/
  cp bin/zcm $pkgdir/usr/bin/
}


# vim:set ts=2 sw=2 et:
