pkgname=dpf-lcd4linux-svn
pkgver=1142
pkgrel=1
pkgdesc="lcd4linux with dpfhack"
arch=(arm x86_64)
url="http://geekparadise.de/2011/04/digitaler-bilderrahmen-von-pearl-als-statusdisplay-fur-dockstar/"
license=('GPL')
depends=(libusb-compat sqlite3 gd)
makedepends=(sdcc subversion python2)
provides=(lcd4linux)
conflicts=(lcd4linux)
source=(http://tech.section5.ch/files/dpfhack-0.1alpha.tgz
        http://tech.section5.ch/files/dpf-lcd4linux.tgz)
md5sums=('415398689d2ea77e83a79c513d44da82'
         '3cccca2797ebb85459dc272a8b9e9b67')

_svntrunk=https://ssl.bulix.org/svn/lcd4linux/trunk
_svnmod=lcd4linux

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    yes t | svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  cd "$srcdir/dpf/src"
  make AS=sdas8051 PYTHON=python2.7

  cd "$srcdir/$_svnmod-build"
  patch -p1 -i $srcdir/dpf/lcd4linux-svn1142-dpf.patch
 
  export CPPFLAGS=-I"$srcdir/dpf/src/dpflib"
  export LDFLAGS=-L"$srcdir/dpf/src/dpflib"
  ./bootstrap
  ./configure --with-drivers='DPF' --with-plugins='all,!dbus,!mpris_dbus'
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make prefix="$pkgdir/usr" install
}
