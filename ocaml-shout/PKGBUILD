# Maintainer: Thoams S Hatch <thatch45 at gmail dot com>
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>
pkgname=ocaml-shout
pkgver=0.2.7
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Bindings for the shout library tools for sending mp3 / ogg data to icecast 2 servers"
url="http://savonet.sourceforge.net/"
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('1e932cf83af693201f17f0f1dcddc47f')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $OCAMLFIND_DESTDIR
  make \
    OCAMLFIND_DESTDIR=$OCAMLFIND_DESTDIR \
    OCAMLFIND_LDCONF=ignore \
    install
}
