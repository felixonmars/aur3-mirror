# $Id: PKGBUILD 86292 2010-07-28 06:43:46Z juergen $
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lua64
_pkgname=lua
pkgver=5.1.4
pkgrel=6
pkgdesc="A powerful light-weight programming language designed for extending applications. (Patched to support 64 bit integers)"
arch=('i686' 'x86_64')
url="http://www.lua.org/"
depends=('readline' 'ncurses')
provides=('lua')
conflicts=('lua')
license=('MIT')
options=('!makeflags')
source=(
  http://www.lua.org/ftp/${_pkgname}-${pkgver}.tar.gz
  http://www.lua.org/ftp/patch-lua-5.1.4-2
  lua-arch.patch
  lua-5.1-cflags.diff
  http://luaforge.net/frs/download.php/4037/lua514-lnum-20090417.patch.tgz
  ltable.patch
)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  echo patch 1
  patch -p1 -i ${srcdir}/lua514-lnum-20090417.patch
  echo patch 2
  patch -p1 -i "${srcdir}/lua-arch.patch"
  echo patch 3
  patch -i ${srcdir}/patch-lua-5.1.4-2 -d src
  echo patch 4
  patch -p0 -i ${srcdir}/ltable.patch
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  echo patch 5
  patch -Np1 -i ${srcdir}/lua-5.1-cflags.diff
  [ "$CARCH" == "x86_64" ] && export CFLAGS="$CFLAGS -fPIC"
  make INSTALL_DATA="cp -d" TO_LIB="liblua.a liblua.so liblua.so.5.1" LUA_SO=liblua.so  INSTALL_TOP="${pkgdir}/usr" INSTALL_MAN="${pkgdir}/usr/share/man/man1" \
    linux install  || return 1
  install -D -m 644 etc/lua.pc "${pkgdir}/usr/lib/pkgconfig/lua.pc"
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"

  # Install the documentation
  mkdir -p "${pkgdir}/usr/share/doc/lua"
  cp -R doc/* "${pkgdir}/usr/share/doc/lua"
}

sha256sums=('b038e225eaf2a5b57c9bcc35cd13aa8c6c8288ef493d52970c9545074098af3a'
            'a7f8ca9a3be52daecb3d3c9988d08ccc2bf9f785b075a0bc6463038356a9ec4c'
            'f1303d4b5acd5580190556f559f282d22ed316c56f7b4e3002514abc314a37b9'
            'c6caed1c07fe80219e484c98850e1de4ff63ac1ce5664978d2c72a4bfec1b9df'
            'b85f4965dd889e472544536bfb80b970f059109cceac63c64bf6bcf25b5a76fa'
            'c67a834acaeab8878e2a1e27965eb68c1424242f7f1bb3019fd8d07dccd3c53c')
