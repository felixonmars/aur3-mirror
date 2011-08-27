# Maintainer: Edwin Marshall <aspidites@inbox.com>

pkgname=usf-bzr
pkgrel=1
pkgver=542
pkgdesc="UltimateSmashFriends is a game based on pygame, which aim at creating quick and fun multiplayer entertainment. "
arch=('i686' 'x86_64')
url="http://usf.tuxfamily.org"
license=('GPLv3')
makedepends=('bzr')
depends=('python-pygame', 'python-numeric') 

_bzrtrunk=lp:ultimate-smash-friends
_bzrmod=ultimate-smash-friends

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."
  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr branch ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  sed -i 's/usr\/bin\/python/usr\/bin\/python2/g' *.py*
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

}
