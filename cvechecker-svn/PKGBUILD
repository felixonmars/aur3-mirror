# Contributor: Michael P <ptchinster@archlinux.org>

pkgname=cvechecker-svn
pkgver=210
pkgrel=1
pkgdesc="a local CVE checker tool"
arch=('i686' 'x86_64')
url="http://cvechecker.sourceforge.net/"
license=('GPL')
groups=()
depends=('libconfig>=1.3' 'sqlite3' 'wget' 'libxslt')
makedepends=('subversion')
provides=('cvechecker')
conflicts=('cvechecker')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_svntrunk="https://cvechecker.svn.sourceforge.net/svnroot/cvechecker/"
_svnmod="cvschecker"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  autoreconf --force --install

  ./configure --prefix=/usr --enable-sqlite3
  make
  make install DESTDIR="${pkgdir}"
  #make postinstall DESTDIR="${pkgdir}"

  cd "${pkgdir}"
  mv "usr/etc" .
}

