# Contributer: Jamie Nguyen <dyscoria@googlemail.com>

pkgname=nethack-fr-x11-svn
_pkgname=nethack
pkgver=20
pkgrel=1
pkgdesc='A single-player roguelike dungeon exploration game in french'
arch=('i686' 'x86_64')
url="http://www.nethack.org/"
license=('custom')
install=nethack-x11.install
depends=('gzip' 'ncurses' 'libxaw' 'libxmu' 'libxext' 'libxt' 'libx11')
makedepends=('subversion')
source=(nethack-x11.patch)
md5sums=('4f90180ce9e306c003c7a1117f8ee6dd')

_svntrunk="https://nethack-fr.svn.sourceforge.net/svnroot/nethack-fr"
_svnmod=nethack-fr

build(){
  msg "Connecting to boinc.berkeley.edu SVN server..."

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}/${_svnmod}-build" ]; then
    rm -rf "${srcdir}/${_svnmod}-build"
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/trunk/

  sh ./sys/unix/setup.sh || return 1

  patch -Np1 -i $srcdir/nethack-x11.patch || return 1

  make || return 1
  make PREFIX=${startdir}/pkg/usr install || return 1

  sed -e 's|HACKDIR=.*/pkg/usr/|HACKDIR=/usr/|' \
      -i ${startdir}/pkg/usr/bin/nethack \
      || return 1

  install -D -m 0644 dat/license \
      ${startdir}/pkg/usr/share/licenses/${_pkgname}/license \
      || return 1
}
