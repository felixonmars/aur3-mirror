# Maintainer: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
# Contributor: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
pkgname=ocamldap
pkgver=2.2
pkgrel=1
pkgdesc="an implementation of the Light Weight Directory Access Protocol"
arch=('i686' 'x86_64')
url="http://git-jpdeplaix.dyndns.org/libs/ocamldap.git/"
license=('LGPL')
depends=('ocaml-pcre' 'ocaml-ssl' 'ocamlnet')
makedepends=('ocaml')
source=(http://bitbucket.org/deplai_j/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
sha512sums=('e24e78497b7c9ed89b0ae73c5773cc9ec28c7c7d317b4b8b39f6b20536ff8f44e15c2657d6aba4bb4689afb5bb155fc7391bea6edab50d0855b22bc457982a2d')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix /usr --destdir "$pkgdir" || return 1
    make || return 1
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
    mkdir -p "$OCAMLFIND_DESTDIR"
    make install
}
