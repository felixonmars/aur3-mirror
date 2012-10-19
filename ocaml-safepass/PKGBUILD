# Maintainer: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
# Contributor: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
pkgname=ocaml-safepass
pkgver=1.2
pkgrel=1
pkgdesc="A library offering facilities for the safe storage of user passwords"
arch=('i686' 'x86_64')
url="http://ocaml-safepass.forge.ocamlcore.org/"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=(http://forge.ocamlcore.org/frs/download.php/1035/$pkgname-$pkgver.tgz)
sha512sums=('61ff545b069c6e9c298e292785f8478c9872395bbb77a08ddd491586064f49ee70d2fcf080d6ba67af631ba5c50709b203c68128664577348bdfafdc2dcaf0a4')

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
    make install || return 1
}
