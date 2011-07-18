# Maintainer: Lucas Januario <lucas dot debiaggi at dashhx dot net>
# original package https://aur.archlinux.org/packages.php?ID=48186
# add a patch found in http://code.google.com/p/e17mods/issues/attachmentText?id=14&aid=140001000&name=01_fix_e_menu_code.diff&token=b94dcb78110272cf014e0a7519a19a3a
# e17 trash module working with e-svn build in 07/15/2011 

pkgname=e17-module-trash
pkgver=418
pkgrel=1
pkgdesc="E17 Freedesktop compliant trash module"
arch=('i686' 'x86_64')
url="http://code.google.com/p/e17mods/wiki/Trash"
license=('GPL')
groups=()
depends=('e' 'thunar')
makedepends=('subversion')
provides=('e17-module-trash')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("fix_e_menu.code.patch")
md5sums=('08910453b948e455705def8cc8623ac2')
noextract=()
#generate with 'makepkg -g'

_svntrunk="http://e17mods.googlecode.com/svn/trunk/MODULES/trash"
_svnmod="e17-module-trash"

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
  msg "patching the e17 trash module"
  patch src/e_mod_main.c $startdir/fix_e_menu.code.patch 
  ./autogen.sh
  ./configure --prefix=/usr/
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
