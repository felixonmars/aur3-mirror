# Maintainer: Andre Wayand <aur-gjiten at awayand dot sleepmail dot com>
# Contributor: Branko Vukelic <bg.branko@gmail.com>

pkgname=gjiten
pkgver=2.6
pkgrel=5
pkgdesc="Japanese and kanji dictionary program for GNOME"
arch=('i686' 'x86_64')
url="http://gjiten.sourceforge.net/"
license=('GPL')
#depends=('gtk2' 'libgnome>=2.2.0' 'libgnomeui>=2.2.0' 'libglade>=2.0' 'gconf>=2.0')
depends=('libgnomeui>=2.2.0')
makedepends=('lynx' 'xmlto' 'perlxml' 'docbook-xsl')
optdepends=(
  'perl: install extra dictionaries'
  'kanjipad: handwritten kanji lookup'
  'scim-anthy: japanese input'
)
install=gjiten.install
source=(
  http://gjiten.sourceforge.net/$pkgname-$pkgver.tar.gz
  http://gjiten.sourceforge.net/dictfiles/edict
  http://gjiten.sourceforge.net/dictfiles/kanjidic
  getdics-updurl.diff
)
md5sums=('44a5d9640e37d8b0547f9c7e3d7ac67a'
         '56aef34061ede99977d87810524a8ab2'
         'd872fa6f0dbcbf901dad8bd8cb1066ef'
         '1b8dfd15373833856499aad20eac165e')

build() {
 cd "${srcdir}/${pkgname}-${pkgver}"
 patch -uN dicfiles/getdics.pl ${srcdir}/getdics-updurl.diff
 ./configure --with-gconf-schema-file-dir=/usr/share/gconf/schemas --prefix=/usr
 make
}

package() {
 cd "${srcdir}/${pkgname}-${pkgver}"
 make DESTDIR="${pkgdir}" install

 msg "Installing extra dictionary script"
 install -d "${pkgdir}"/usr/share/gjiten/dicfiles
 install -Dm0644 -t "${pkgdir}"/usr/share/gjiten/dicfiles dicfiles/{getdics.pl,Makefile,Makefile.am,Makefile.in}

 msg "Installing dictionaries"
 cd "${srcdir}"
 install -Dm0644 edict "${pkgdir}"/usr/share/gjiten/dics/edict
 install -m0644 kanjidic "${pkgdir}"/usr/share/gjiten/dics/kanjidic 
}
