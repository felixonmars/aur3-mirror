# Maintainer: Philipp Gesang <phg42.2a@gmail.com>
#
# Derived from the Lua 5.2 and 5.1 PKGBUILDs in extra which lists
# these guys as contributors:
#
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
#
# Before trying this out make sure you read the changelog:
#
#     http://www.lua.org/manual/5.3/readme.html#changes
#

pkgname=lua53
pkgver=5.3.0
pkgrel=2
pkgdesc='Powerful light-weight programming language designed for extending applications, version 5.3.0'
arch=('i686' 'x86_64')
url='http://www.lua.org/'
depends=('readline')
license=('MIT')
options=('!makeflags' '!emptydirs')
source=('http://www.lua.org/ftp/lua-5.3.0.tar.gz'
        'liblua.so.patch'
        'LICENSE'
        'lua.pc')
sha512sums=('2b423e70c4c992a08d28ef12f1d0b078f2ee7043cda302d93e9d59ff6ab79152bb4971455d37666a98cf5cfe3cafd3d16e30b33a11fd585743d5d817424a2d51'
            'bcb85d5863685473dcff1e615cfbadaede09440e4fcab1d32ea1cd6fca543e4e549084901cc5df72089ef145e213a763c26570637c539b7689b6e4e5cd129941'
            '4f2dcdf727fa87cb1a89e8f9e678b6245b7af1722c74d4c04adc865745c80a0ce292fd5c18787fb3c00ec44bfa07a49ffed2fcb71008a84f4464933ab4bd3d38'
            'f7e6b5be3393634c20df8a25b1da2596da5717ff652a49f6ba18b86f55f7edc4d63b51a1414f4147dc490554228caca03f34e8ff5da32f6cfaff40ac85e710ca')

build() {
  declare -r dstdir="lua-${pkgver}"
  cd "${dstdir}"
  patch -p1 -i "${srcdir}/liblua.so.patch"
  export CFLAGS="${CFLAGS} -fPIC"
  sed "s/%VER%/${pkgver%.*}/g;s/%REL%/${pkgver}/g" ../lua.pc > lua.pc
  sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.3/' -e '/^LUAC_T=/ s/luac/luac5.3/' -i src/Makefile
  make MYCFLAGS="${CFLAGS}" MYLDFLAGS="${LDFLAGS}" linux
}

package() {
  declare -r dstdir="lua-${pkgver}"
  cd "${dstdir}"
  make                                                                    \
    TO_BIN="lua5.3 luac5.3"                                               \
    TO_LIB="liblua5.3.a liblua5.3.so liblua5.3.so.5.3 liblua5.3.so.5.3.0" \
    INSTALL_DATA="cp -d"                                                  \
    INSTALL_TOP="${pkgdir}/usr"                                           \
    INSTALL_INC="${pkgdir}/usr/include/lua5.3"                            \
    INSTALL_MAN="${pkgdir}/usr/share/man/man1"                            \
    install
  install -Dm644 lua.pc "${pkgdir}/usr/lib/pkgconfig/lua5.3.pc"
  install -d "${pkgdir}/usr/share/doc/lua5.3"
  install -m644 doc/*.{gif,png,css,html} "${pkgdir}/usr/share/doc/lua5.3"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s liblua5.3.so "${pkgdir}/usr/lib/liblua.so.5.3"
  ln -s liblua5.3.so "${pkgdir}/usr/lib/liblua.so.${pkgver}"
  cd "${pkgdir}/usr/share/man/man1"
  mv lua.1 lua5.3.1
  mv luac.1 luac5.3.1
}

# vim:set ts=2 sw=2 et:
