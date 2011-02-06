#Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=ocaml-stomp-git
pkgver=1.0
pkgrel=1
pkgdesc="Text Orientated Messaging Protocol client implementation in OCaml."
arch=('i686' 'x86_64')
url="http://github.com/mfp/ocaml-stomp"
license=('MIT')
depends=('ocaml' 'ocaml-findlib' 'lwt' 'ocaml-extlib' 'ocaml-cryptokit')
makedepends=('omake' 'git')
source=()

build() {
  cd $srcdir

  if [ -d ocaml-stomp ]; then
    cd ocaml-stomp
    git pull origin
  else
    git clone git://github.com/mfp/ocaml-stomp.git
    cd ocaml-stomp
  fi

  omake || return 1
  omake doc || return 1

  install -Dm 644 stomp.cma $pkgdir/usr/lib/ocaml/site-lib/stomp/stomp.cma
  install -Dm 644 stomp.cma $pkgdir/usr/lib/ocaml/site-lib/stomp/stomp.cmxa
  cat >$pkgdir/usr/lib/ocaml/site-lib/stomp/META <<EOF
version = "$pkgver"
description = "$pkgdesc"
requires = "lwt,extlib,cryptokit"
archive(byte) = "stomp.cma"
archive(native) = "stomp.cmxa"
EOF

  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  mkdir -p $pkgdir/usr/share/doc/ocaml-stomp
  cp -R doc/* $pkgdir/usr/share/doc/ocaml-stomp
}
