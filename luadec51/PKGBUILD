# Contributor: Tim Hatch <tim@timhatch.com>
pkgname=luadec51
pkgver=2.0
pkgrel=1
_luaver=5.1.4
_forgeid=4008
pkgdesc="Disassembler for Lua compiled bytecode"
arch=(i686 x86_64)
depends=(lua glibc)
url="http://luadec51.luaforge.net/index.html"
license=('MIT')
source=(http://gentoo.mirrors.pair.com/distfiles/lua-${_luaver}.tar.gz \
        http://luaforge.net/frs/download.php/${forgeid}/luadec51_${pkgver}.tgz \
        Makefile
        luadec51.license)
md5sums=('d0870f2de55d59c1c8419f36e8fac150' \
         'bc94202f9b68d51033bd4586ba4e2cf8' \
         '14b56fa4da33010665204d8b6b7eb4b9' \
         'b372f9646d252062f030618ded501cde')

build() {
  pushd "$srcdir/luadec" || return 1
  make -f ../Makefile luadec || return 1
  install -Dm755 luadec "$pkgdir/usr/bin/luadec51"
  popd

  install -Dm644 luadec51.license "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" || return 1
} 



