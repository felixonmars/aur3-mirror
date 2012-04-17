# Maintainer: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>

pkgname=erlang-r15b
pkgver=R15B01
pkgrel=1
pkgdesc="Temporary erlang R15B until included in extra"
arch=(i686 x86_64)
url="http://www.erlang.org"
license=('custom')
depends=('ncurses' 'glibc')
provides=('erlang')
conflicts=('erlang')
makedepends=('java-environment' 'perl' 'wxgtk' 'openssl' 'unixodbc>=2.3.1' 'mesa')
optdepends=('wxgtk: for wx support' 
    'mesa: for gl support in wx' 
    'tcl: for toolbar support (with tk)'
    'tk: for toolbar support (with tcl)'
    'java-environment: for jinterface/ic support'
    'unixodbc: database')

options=('!makeflags')
source=(http://www.erlang.org/download/otp_src_${pkgver/./-}.tar.gz
	http://www.erlang.org/download/otp_doc_man_${pkgver/./-}.tar.gz)
md5sums=('f12d00f6e62b36ad027d6c0c08905fad'
         'd87412c2a1e6005bbe29dfe642a9ca20')
         
build() {
  cd "$srcdir/otp_src_${pkgver/./-}"
  export ERTSVERSION=$(sed -n 's/^VSN[ ]*=[ ]*\([0-9.]\)/\1/p' < erts/vsn.mk)
  export ERLINTERFACEVERSION=$(sed -n 's/^EI_VSN[ ]*=[ ]*\([0-9.]\)/\1/p' < lib/erl_interface/vsn.mk)

  sed -i '/SSL_DYNAMIC_ONLY=/s:no:yes:' erts/configure

  CFLAGS="${CFLAGS} -fno-strict-aliasing" ./configure --prefix=/usr --enable-smp-support --enable-threads -enable-native-libs
  make
}

package() {
  cd "$srcdir/otp_src_${pkgver/./-}"
  make INSTALL_PREFIX="$pkgdir" install

# fix prefix
  cd "$pkgdir"
  for i in usr/lib/erlang/bin/erl \
      usr/lib/erlang/bin/start \
      usr/lib/erlang/erts-${ERTSVERSION}/bin/erl \
      usr/lib/erlang/erts-${ERTSVERSION}/bin/start \
      usr/lib/erlang/releases/RELEASES ;do
    sed -i "s#$pkgdir##" $i
  done

# fix symlinks
  cd "$pkgdir/usr/lib/erlang/bin"
  ln -sf ../erts-${ERTSVERSION}/bin/epmd

  cd "$pkgdir/usr/bin"
  for file in *; do
    ln -sfv ../lib/erlang/bin/$file
  done

  ln -s ../lib/erlang/lib/erl_interface-${ERLINTERFACEVERSION}/bin/erl_call "$pkgdir/usr/bin/erl_call"

# install documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -D -m644 "$srcdir"/{COPYRIGHT,PR.template,README} "$pkgdir/usr/share/doc/erlang"
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang"

  install -Dm644 "$srcdir/otp_src_${pkgver/./-}/EPLICENCE" "$pkgdir/usr/share/licenses/$pkgname/EPLICENCE"

}

