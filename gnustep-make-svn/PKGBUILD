# Contributor: Mildred <silkensedai@online.fr>
# kate: hl bash; space-indent on; indent-width 2;
# use versionpkg

pkgname=gnustep-make-svn
pkgver=25198
pkgrel=2
pkgdesc="Makefile system for GNUstep"
arch=(i686)
url="http://gnustep.org/"
license=('LGPL')
depends=()
makedepends=('subversion')
provides=(gnustep-make)
conflicts=(gnustep-make)
replaces=()
backup=()
install=
source=(GNUstep.sh)
noextract=()
md5sums=(8fed42c0052628aa3f0ce34f56321689)

_svntrunk="http://svn.gna.org/svn/gnustep/tools/make/trunk/"
_svnmod=gnustep-make

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

  msg "Install ..."

  install -D "$startdir/src/GNUstep.sh" "$startdir/pkg/etc/profile.d/GNUstep.sh"
  sed -i 's|%GNUSTEPDIR%|/opt/GNUstep|' "$startdir/pkg/etc/profile.d/GNUstep.sh"
  make DESTDIR="$startdir/pkg" install
}
