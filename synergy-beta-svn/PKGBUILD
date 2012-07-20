# Maintainer: Barton Cline <barton bcdesignswell com>
# Contributor: Kerrick Staley <mail kerrickstaley com>
# Contributor: George Nassar <george@providentdata.com>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=synergy-beta-svn
pkgver=1536
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'bash')
conflicts=('synergy' 'synergy-beta')
provides=('synergy' 'synergy-beta')
license=('GPL2')
makedepends=('libxt' 'cmake' 'python2')       # used by configure to test for libx11...
backup=('etc/synergy.conf')
source=("synergys.rc")
md5sums=('8f8c01add9bf6e3ae9f37a36ca6345b6')


_svntrunk="http://synergy-plus.googlecode.com/svn/tags/1.4.9/"
_svnmod="synergy"

build() {
  cd $srcdir
msg "Connecting to $_svntrunk SVN server...."

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
    msg "SVN update done or server timeout"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg "SVN checkout done or server timeout"
  fi
  
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  msg "Starting make..."  
  cmake  -D CMAKE_INSTALL_PREFIX=/usr .
#cmake  -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_CXX_FLAGS='-g' .   # enable this line instead to compile debug symbols into the binaries
  make
  
  msg "Building GUI"
  (cd src/gui && qmake && make)

}

package() {
msg "Packaging in $pkgdir"
msg "cd $srcdir/$_svnmod-build/$_svnmod"
  cd $srcdir/$_svnmod-build
  
  # install binary
  install -d "$pkgdir/usr/bin/"
  install -Dm755 bin/synergyc "$pkgdir/usr/bin/"
  install -Dm755 bin/synergys "$pkgdir/usr/bin/"

  # install rc.d script  and config
  install -d "$pkgdir/etc/rc.d"
  install -Dm644 doc/synergy.conf.example-basic "$pkgdir/etc/synergy.conf" # true
  install -Dm755 "$srcdir/synergys.rc" "$pkgdir/etc/rc.d/synergys" # true
  
#  rm -r $srcdir/$_svnmod-build
}

