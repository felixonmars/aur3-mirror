# Maintainer: gwhite <gwhite AT kupulau DOT com>

pkgname='profile-sync-daemon-git-pycharm'
pkgver=5.67
pkgrel=1
pkgdesc='Syncs browser profiles to tmpfs reducing SSD/HDD calls and speeding-up browsers.'
arch=('any')
url='https://github.com/graysky2/profile-sync-daemon'
license=('MIT')
depends=('procps-ng' 'rsync')
conflicts=('firefox-sync' 'goanysync' 'go-anysync-git' 'iceweasel-sync'
'tmpfs-store' 'tmpfs-sync' 'user-profile-sync-daemon', 'profile-sync-daemon')

_gitroot="https://github.com/graysky2/profile-sync-daemon.git"
_gitname="profile-sync-daemon"

source=('add_pycharm.patch')
sha256sums=('1e630e48e40b1116d0a8dae4792d6a6055e8a9a5310552eb5d337d774f136912')

backup=('etc/psd.conf')
install=psd.install

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi

    git fetch --all
    git reset --hard origin/master
    #git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  cd ${srcdir}/${_gitname}
  patch -p1 --verbose -i $srcdir/add_pycharm.patch
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
}

package() {
  cd ${srcdir}/${_gitname}
	
	# note if you want to use openrc rather than systemd, change the below make
	# target to 'install-openrc-all' before building and be sure that you read
	# the INSTALL document provided in the source tarball!
  make DESTDIR="$pkgdir" install-systemd-all
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
