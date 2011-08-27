# Contributor: Mildred <silkensedai@online.fr>
# kate: hl Bash; space-indent on; indent-width 2;
# use versionpkg

pkgname=gworkspace.app-svn
pkgver=25182
pkgrel=1
pkgdesc="The GNUstep Workspace"
arch=(i686)
url="http://www.gnustep.it/enrico/gworkspace/"
license=('GPL')
depends=()
makedepends=('subversion')
provides=(gworkspace.app)
conflicts=(gworkspace.app)
replaces=()
backup=()
install=
source=()
noextract=()
md5sums=()

_svntrunk="http://svn.gna.org/svn/gnustep/apps/gworkspace/trunk/"
_svnmod=gworkspace.app

build() {
  cd "$startdir/src"

  if [ -d "$_svnmod/.svn" ]; then
    msg "SVN update $_svnmod"
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    msg "SVN checkout $_svntrunk $_svnmod"
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout. Preparing sources..."

  cp -r "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"

  msg "Starting make..."

  export MAKEFLAGS="`sed 's/-j[0-9]*//g' <<<"$MAKEFLAGS"`"
  ./configure --prefix=/opt/GNUstep
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
