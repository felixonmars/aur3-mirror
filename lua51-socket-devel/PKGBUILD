# Maintainer: Dwayne Bent <dbb@dbb.io>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgbase=luasocket-devel
pkgname=(lua51-socket-devel)
pkgver=3.0rc1
_pkgver=3.0-rc1
pkgrel=1
pkgdesc='Networking support library for the Lua language'
arch=('i686' 'x86_64')
url='https://github.com/diegonehab/luasocket'
license=('MIT')
conflicts=('lua51-socket' 'lua51-socket-prosody')
provides=('lua51-socket' 'lua51-socket-prosody')
makedepends=('lua' 'lua51')
source=("https://github.com/diegonehab/luasocket/archive/v${_pkgver}.tar.gz")
md5sums=('08bd2f265b244eb4bf5c2c36bf89b759')

build() {
#  cp -a luasocket-$pkgver luasocket-$pkgver-52
#  msg2 'Building with lua 5.2'
#  pushd luasocket-$pkgver-52
#  patch -Np1 -i "$srcdir/luasocket-unixsocket.patch"
#  make
#  popd
  msg2 'Building with lua 5.1'
  cd luasocket-$_pkgver
  make LUAINC_linux=/usr/include/lua5.1 linux
}

#package_lua-socket() {
#  depends=('lua')
#  cd luasocket-$pkgver-52
#  make DESTDIR="$pkgdir/" \
#    INSTALL_TOP_SHARE='$(DESTDIR)/usr/share/lua/5.2' \
#    INSTALL_TOP_LIB='$(DESTDIR)/usr/lib/lua/5.2' install
#  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#}

package_lua51-socket-devel() {
  depends=('lua51')
  cd luasocket-$_pkgver
  make DESTDIR="$pkgdir/" \
    prefix='/usr' \
    INSTALL_TOP_SHARE='$(DESTDIR)/usr/share/lua/5.1' \
    INSTALL_TOP_LIB='$(DESTDIR)/usr/lib/lua/5.1' install-unix
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

