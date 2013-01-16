pkgname=hvec-hm-svn
pkgver=3119
pkgrel=1
pkgdesc="HEVC Test Model (HM) Reference Software (H265)"
arch=('x86_64' 'i686')
url="http://hevc.info/"
license=('BSD')
depends=('gcc-libs')
makedepends=('svn')

_svntrunk=https://hevc.hhi.fraunhofer.de/svn/svn_HEVCSoftware/trunk
_svnmod=hvec-hm

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  cd build/linux
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -Dm755 bin/annexBbytecountStatic "$pkgdir/usr/bin/annexBbytecountStatic"
  install -Dm755 bin/convert_NtoMbit_YCbCrStatic "$pkgdir/usr/bin/convert_NtoMbit_YCbCrStatic"
  install -Dm755 bin/TAppDecoderStatic "$pkgdir/usr/bin/TAppDecoderStatic"
  install -Dm755 bin/TAppEncoderStatic "$pkgdir/usr/bin/TAppEncoderStatic"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/hvec-hm-svn/COPYING"
}
