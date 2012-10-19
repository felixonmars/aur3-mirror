# Maintainer: Charles E. Hawkins
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>
pkgname=ocaml-soundtouch
pkgver=0.1.7
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="for soundtouch audio effects"
url="http://savonet.sourceforge.net/"
depends=('soundtouch')
makedepends=('ocaml' 'ocaml-findlib' 'soundtouch')
source=("http://downloads.sourceforge.net/savonet/$pkgname-$pkgver.tar.gz")
md5sums=('8249e34b555d6484b70711d6b1ef9d2e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
