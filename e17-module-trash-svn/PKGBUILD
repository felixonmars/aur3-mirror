# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=e17-module-trash-svn
pkgver=480
pkgrel=1
pkgdesc="E17 Freedesktop compliant trash module"
arch=('i686' 'x86_64')
url="http://code.google.com/p/e17mods/wiki/Trash"
license=('GPL')
groups=()
depends=('e')
makedepends=('subversion')
provides=('e17-module-trash')
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
source=("FMandClick.patch" "AutoMake.patch")
md5sums=('f840d9bd1b996dbfadaf3e9f67a0de85'
         'fefec916c90c68531f285d13cb9122ce')


_svntrunk="http://e17mods.googlecode.com/svn/trunk/MODULES/trash"
_svnmod="e17-module-trash"

build() {
  cd "$srcdir"
  msg "Connecting to $_svntrunk SVN server...."

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
    msg "SVN update done or server timeout"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg "SVN checkout done or server timeout"
  fi

  msg "Applying File Manager, DoubleClick and configure.am patches..."
  (cd "$_svnmod" && svn patch "../../FMandClick.patch")
  (cd "$srcdir/$_svnmod" && svn patch "../AutoMake.patch")

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  msg "Running autogen and configure..."  
  ./autogen.sh
  ./configure
  msg "Starting make..."  
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
