# Maintainer : alf500 <hammerm98 [at] googlemail [dot] com>

pkgname="erlang-xmlrpc"
pkgver="1.13"
pkgrel="1"
pkgdesc="This is an HTTP 1.1 compliant XML-RPC library for Erlang. It is
         designed to make it easy to write XML-RPC Erlang clients and/or
         servers. The library is compliant with the XML-RPC specification
         published by http://www.xmlrpc.org/."
url="http://www.ejabberd.im/contributions"
license=("unknown")
arch=("i686" "x86_64")
source=("http://ejabberd.jabber.ru/files/contributions/xmlrpc-$pkgver-ipr2.tgz"
        "makefile.patch")
md5sums=('c1905556e01d8970681b93dcba892442'
         'b0a1b3b8e81b0fe7fd6a88e015bafc19')
depends=('erlang')
makedepends=('erlang')

build() {
  cd $srcdir/xmlrpc-$pkgver/src
  patch -Np1 -i ../../makefile.patch || return 1

  make || return 1

  install -d -m 0755 $pkgdir/usr/lib/erlang/lib
  cp -a $srcdir/xmlrpc-$pkgver $pkgdir/usr/lib/erlang/lib/

}
