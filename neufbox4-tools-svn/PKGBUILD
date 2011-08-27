# Contributor: Mildred <silkensedai@online.fr>
# kate: hl Bash; space-indent on; indent-width 2;
# use versionpkg

pkgname=neufbox4-tools-svn
pkgver=92
pkgrel=1
pkgdesc="NeufBox4 tools"
arch=(i686)
url="http://www.neufbox4.org"
license=('GPL')
depends=(zlib tftp-hpa python pylzma)
makedepends=('subversion' zlib)
provides=(neufbox4-tools)
conflicts=(neufbox4-tools)
replaces=(openbox4-tools-svn)
backup=()
groups=()
options=(docs)
install=
source=()
noextract=()
md5sums=()

_svntrunk="http://svn.gna.org/svn/openbox4/trunk/tools"
_svnmod=openbox4-tools

build() {
  local dest="$startdir/pkg"
  cd "$startdir/src"

  if [ -d "$_svnmod/.svn" ]; then
    msg "SVN update $_svnmod"
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    msg "SVN checkout $_svntrunk $_svnmod"
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN operation done or server timeout. Preparing sources..."

  cp -ruTf "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"

  msg "In `pwd` Starting build..."

  for d in nb4-adsl nb4-concat nb4-extract nb4-unsquash unsqlzma; do
    msg "Building $d"
    cd "$d"
    make || return 1
    cd ..
  done

  msg "Installing nb4-concat"
  cd nb4-concat
  install -D "nb4-concat" "$dest/usr/bin/nb4-concat"
  install -D "README" "$dest/usr/share/$pkgname/README.nb4-concat"
  cd ..
  msg "Installing nb4-extract"
  cd nb4-extract
  install -D "nb4-extract" "$dest/usr/bin/nb4-extract"
  install -D "README" "$dest/usr/share/$pkgname/README.nb4-extract"
  cd ..
  msg "Installing nb4-adsl"
  cd nb4-adsl
  install -D "nb4-adsl" "$dest/usr/bin/nb4-adsl"
  install -D "README" "$dest/usr/share/$pkgname/README.nb4-adsl"
  cd ..
  msg "Installing nb4-unsquash"
  install -D nb4-unsquash/unsquashfs "$dest/usr/bin/nb4-unsquash"
  install -D nb4-unsquash/README "$dest/usr/share/$pkgname/README.nb4-unsquash"
  msg "Installing nb4-getfirm"
  install -D scripts/getfirm.sh "$dest/usr/bin/nb4-getfirm"
  msg "Installing nb4-unsqlzma"
  install -D unsqlzma/unsqlzma "$dest/usr/bin/nb4-unsqlzma"
  install -D unsqlzma/README "$dest/usr/share/$pkgname/README.nb4-unsqlzma"
  msg "Installing nb4-unsquash.py"
  install -D unsquash/unsquash.py "$dest/usr/bin/nb4-unsquash.py"
  install -D unsquash/README "$dest/usr/share/$pkgname/README.nb4-unsquash.py"
  install -D autocreate-firmware/Makefile "$dest/usr/share/$pkgname/Makefile.kernel"
}
