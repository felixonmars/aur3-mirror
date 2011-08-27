 
# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=tk84
pkgver=8.4.19
pkgrel=1
pkgdesc="The Tcl scripting language"
arch=('i686' 'x86_64')
license=('custom:"ActiveState License"')
depends=('glibc' 'tcl84')
source=(http://downloads.sourceforge.net/sourceforge/tcl/tk${pkgver}-src.tar.gz)
url="http://tcl.sourceforge.net/"
md5sums=('9b998d0456d1b956eb9da610837a9c47')

build() {
  cd ${startdir}/src/tk${pkgver}/unix
if [ "$CARCH" = "x86_64" ]; then
  ./configure --prefix=/usr --enable-64bit
  else   ./configure --prefix=/usr --disable-64bit
fi
  make || return 1
  make INSTALL_ROOT=${startdir}/pkg install 

#install-private-headers
#  ln -sf tclsh8.4 ${startdir}/pkg/usr/bin/tclsh
  # install license
 # install -Dm644 ../license.terms $startdir/pkg/usr/share/licenses/$pkgname/LICENSE


 # remove buildroot traces / fixes #3602
 #sed -i \
 #-e "s,^TK_BUILD_LIB_SPEC='-L.*/unix,TK_BUILD_LIB_SPEC='-L/usr/lib," \
 #-e "s,^TK_SRC_DIR='.*',TK_SRC_DIR='/usr/include'," \
 #-e "s,^TK_BUILD_STUB_LIB_SPEC='-L.*/unix,TK_BUILD_STUB_LIB_SPEC='-L/usr/lib," \
 #-e "s,^TK_BUILD_STUB_LIB_PATH='.*/unix,TK_BUILD_STUB_LIB_PATH='/usr/lib," \
 #-e "s,^TK_LIB_FILE='libtcl8.5..TK_DBGX..so',TK_LIB_FILE=\"libtcl8.5\$\{TK_DBGX\}.so\"," \
 #-e "s,^TK_CC_SEARCH_FLAGS='\(.*\)',TK_CC_SEARCH_FLAGS='\1:/usr/lib'," \
 #-e "s,^TK_LD_SEARCH_FLAGS='\(.*\)',TK_LD_SEARCH_FLAGS='\1:/usr/lib'," \
 #$startdir/pkg/usr/lib/tclConfig.sh
}
