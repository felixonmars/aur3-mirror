# Contributor: Mildred <silkensedai@online.fr>
# kate: hl bash; space-indent on; indent-width 2;
# use versionpkg

pkgname=gnustep-back-svn
pkgver=28277
pkgrel=1
pkgdesc="The GNUstep GUI Backend"
arch=(i686)
url="http://gnustep.org/"
license=('LGPL')
depends=(libgl libxmu gcc-objc freetype2 libart-lgpl cairo)
makedepends=('subversion')
provides=(gnustep-back)
conflicts=(gnustep-back)
replaces=()
backup=()
source=()
noextract=()
md5sums=()

_svntrunk="http://svn.gna.org/svn/gnustep/libs/back/trunk/"
_svnmod=gnustep-back

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

  . /etc/profile.d/GNUstep.sh
  export MAKEFLAGS="`sed 's/-j[0-9]*//g' <<<"$MAKEFLAGS"`"
  ./configure --prefix=/opt/GNUstep --enable-graphics=cairo
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
