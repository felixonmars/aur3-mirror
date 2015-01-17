# Maintainer: not me
pkgname=jackline
pkgver="0.1.0"
pkgrel=1
pkgdesc="XMPP client in OCaml"
arch=('i686' 'x86_64')
source=(git://github.com/hannesm/xmpp-opam)
md5sums=(SKIP)
url="https://github.com/hannesm/jackline"
license=custom
depends=('opam' 'aspcud' 'gmp' 'ocaml-camomile')

pkgver() {
grep -Po "(?<=^version:\s).*" $srcdir/xmpp-opam/packages/jackline/jackline.*/opam | tr -d " "
}


build() {
mkdir tmpinstall
export OPAMROOT=$srcdir/tmpinstall
cd tmpinstall
echo "N" | opam init
opam switch 4.02.1
opam repo add xmpp-dev $srcdir/xmpp-opam
opam update
yes | opam install jackline
}

package() {
  export OPAMROOT=$srcdir/tmpinstall
  install -Dm755 $OPAMROOT/4.02.1/bin/jackline $pkgdir/usr/bin/jackline.real
  echo "#!/bin/sh
CAMOMILE_DIR=/usr/share/camomile jackline.real" > $pkgdir/usr/bin/jackline
  chmod 755 $pkgdir/usr/bin/jackline
  install -Dm644 $OPAMROOT/packages.dev/$pkgname.$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
