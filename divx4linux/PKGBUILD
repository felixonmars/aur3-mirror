# $Id: PKGBUILD,v 1.1 2007/11/26 05:24:45 Snowman Exp $
# Maintainer: loafer <davemorgan353 at btinternet dot com>
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=divx4linux
pkgver=6.1.1
pkgrel=2
license=('custom')
depends=('gcc-libs>=4.0.1')
pkgdesc="DivX libraries (nonfree)"
arch=(i686 x86_64)
url="http://labs.divx.com/DivXLinuxCodec"
source=(http://download.divx.com/labs/divx611-20060201-gcc4.0.1.tar.gz)

#
# NOTE:  This software is not open source
#

build() {
   cd "$startdir/src/divx611-20060201-gcc4.0.1/"
   mkdir -p "$startdir/pkg/usr/{lib,include,share/licenses/$pkgname}"
   # install license
   install -m644 EULA.txt "$startdir/pkg/usr/share/licenses/$pkgname/LICENSE"

   unzip -P h08pzt4 contents.dat
   cp lib/*.so "$startdir/pkg/usr/lib"
   cp -r include "$startdir/pkg/usr/include/divx"
   ln -s libdivx.so "$startdir/pkg/usr/lib/libdivx.so.0"
   chown -R root.root "$startdir/pkg/usr"
   chmod 755 "$startdir/pkg/usr/lib"
}
md5sums=('9f5a224f036417375628cda747a170cd')
