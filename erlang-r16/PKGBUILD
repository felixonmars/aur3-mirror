# $Id: PKGBUILD 69792 2012-04-23 09:41:50Z ibiru $
# Maintainer: Steffen Hanikel <arch@42productions.org>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>

pkgname=erlang-r16
pkgver=R16B03
pkgrel=1
pkgdesc='Version R16 of Erlang'
arch=(i686 x86_64)
url='http://www.erlang.org/index.html'
license=('custom')
depends=('ncurses' 'glibc')
provides=('erlang' 'erlang-nox')
makedepends=('java-environment' 'perl' 'openssl' 'wxgtk' 'mesa')
optdepends=('wxgtk: for wx support'
            'mesa: for wx support'
            'java-environment: for Java support')
options=('!makeflags' 'staticlibs')
source=("http://www.erlang.org/download/otp_src_${pkgver/./-}.tar.gz"
        "http://www.erlang.org/download/otp_doc_man_${pkgver/./-}.tar.gz")
md5sums=('c330150913556a0fe73e57a441cb6375'
         '099ed598feadc54e7efea908cc598f08')

build() {
  cd "$srcdir/otp_src_${pkgver/./-}"

  export ERTSVERSION=$(sed -n 's/^VSN[ ]*=[ ]*\([0-9.]\)/\1/p' < erts/vsn.mk)
  export ERLINTERFACEVERSION=$(sed -n 's/^EI_VSN[ ]*=[ ]*\([0-9.]\)/\1/p' < \
    lib/erl_interface/vsn.mk)

  sed -i '/SSL_DYNAMIC_ONLY=/s:no:yes:' erts/configure

  CFLAGS="${CFLAGS} -fno-strict-aliasing" ./configure --prefix=/usr --enable-smp-support \
    --enable-threads --disable-hipe --enable-smp-support
  make -j4
}

package() {
  cd "$srcdir/otp_src_${pkgver/./-}"

  make -j4 INSTALL_PREFIX="$pkgdir" install

  # fix prefix
  cd "$pkgdir/usr/lib/erlang"
  sed -i "s#$pkgdir##" bin/erl bin/start "erts-${ERTSVERSION}/bin/erl" \
    "erts-${ERTSVERSION}/bin/start" releases/RELEASES

  # fix symlinks
  cd bin/
  ln -sf "../erts-${ERTSVERSION}/bin/epmd"

  cd "$pkgdir/usr/bin"
  for file in *; do
    ln -sfv "../lib/erlang/bin/$file"
  done

  ln -s "../lib/erlang/lib/erl_interface-${ERLINTERFACEVERSION}/bin/erl_call" \
    "$pkgdir/usr/bin/erl_call"

  # install documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -Dm0644 "$srcdir"/{COPYRIGHT,PR.template,README} "$pkgdir/usr/share/doc/erlang"

  # install man pages
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang"

  # install license
  install -Dm644 "$srcdir/otp_src_${pkgver/./-}/EPLICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname/EPLICENCE"
}
