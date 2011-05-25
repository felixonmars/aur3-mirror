#Contributor: serp <serp256 at gmail dot com>
pkgname=ocaml-gettext
pkgver=0.3.3
pkgrel=1
pkgdesc="Ocaml wrapper around gettext"
arch=('i686' 'x86_64')
url="http://le-gall.net/sylvain+violaine/ocaml-gettext.html"
license=('AS-IS')
depends=('gettext' 'ocaml>=3.10.0' 'ocaml-findlib' 'ocaml-camomile>=0.8.0' 'ocaml-fileutils' 'docbook-xml' 'docbook-xsl')
source=(camomile.patch http://le-gall.net/sylvain+violaine/download/$pkgname-$pkgver.tar.gz)
md5sums=('6aeba340ae303a910cdcbe6ac4b74a0f' 'f1105a62770e6175490e79b803d59e0c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i ../camomile.patch
  sed -i "s%schema/dtd/4.3%docbook/xml-dtd-4.3%" doc/*.xml
  sed -i "s/cd test.*//" Makefile
  ./configure --prefix /usr --exec-prefix=$pkgdir \
	--docdir=$pkgdir/usr/share/doc/ocaml-gettext \
        --mandir=$pkgdir/usr/share/man \
	--with-docbook-stylesheet=/usr/share/xml/docbook/xsl-stylesheets-1.76.1/
  make -C libgettext-ocaml all
  make -C libgettext-stub-ocaml all
  make -C libgettext-camomile-ocaml all
  make -C libgettext-camomile-ocaml all
  make -C ocaml-gettext all
  make -C doc all
}
 
package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"
  cd "${srcdir}/${pkgname}-${pkgver}"
  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  make -C libgettext-ocaml install
  make -C libgettext-stub-ocaml install
  make -C libgettext-camomile-ocaml install
  make -C ocaml-gettext install
  make -C doc install
}

