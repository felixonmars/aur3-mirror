# Maintainer: Michael P <ptchinster@archlinux.org>
pkgname=honeysnap-svn
pkgver=473
pkgrel=1
pkgdesc="Modular Python application that can read pcap files and perform diagnostics"
arch=('any')
url="https://projects.honeynet.org/honeysnap/"
license=('GPL')
groups=()
depends=('python2' 'libpcap' 'pypcap-svn')
makedepends=('subversion')
provides=('honeysnap')
conflicts=('honeysnap')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_svntrunk="https://projects.honeynet.org/svn/honeysnap/trunk"
_svnmod="honeysnap"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
}

