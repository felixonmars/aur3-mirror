# Maintainer: Andreas B. Wagner <AndreasBWagner@gmail.com>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>
pkgname=docbook-xml-dtd
pkgver=4.4
pkgrel=2
pkgdesc="Docbook DTD for XML"
arch=('i686' 'x86_64')
url="http://www.docbook.org/xml/index.html"
license=(X11)
depends=('sgml-common')
makedepends=('docbook-xsl' 'unzip' 'libxml2')
replaces=('docbook-xml')
install=docbook-xml-dtd.install
source=(http://www.docbook.org/xml/${pkgver}/docbook-xml-${pkgver}.zip catalog \
        build-docbook-catalog-1.2 deleteDocBookCatalog)
md5sums=('cbb04e9a700955d88c50962ef22c1634'
'5aa09ba1ca35e8f872a19e43c1b6349c'
'4ff52cf50d08cd8c9916fc7766b2c761'
'c5c9e8ce1781ad33402a4e5396037680')

build() {
  cd $srcdir
  sed -i -e '1i\\OVERRIDE YES' docbook.cat
  
  mkdir -p $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent
  for each in  *.dtd *.mod docbook.cat catalog.xml catalog; do
    install -D -m 755 ${each} $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}
  done
    install -D -m 755 $srcdir/build-docbook-catalog-1.2 $pkgdir/usr/bin/build-docbook-catalog
    install -D -m 755 $srcdir/deleteDocBookCatalog $pkgdir/usr/bin/deleteDocBookCatalog
    cp $srcdir/ent/isoamsa.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsa.ent
    cp $srcdir/ent/isoamsb.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsb.ent
    cp $srcdir/ent/isoamsc.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsc.ent
    cp $srcdir/ent/isoamsn.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsn.ent
    cp $srcdir/ent/isoamso.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amso.ent
    cp $srcdir/ent/isoamsr.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsr.ent
    cp $srcdir/ent/isobox.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-box.ent
    cp $srcdir/ent/isocyr1.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-cyr1.ent
    cp $srcdir/ent/isocyr2.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-cyr2.ent
    cp $srcdir/ent/isodia.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-dia.ent
    cp $srcdir/ent/isogrk1.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk1.ent
    cp $srcdir/ent/isogrk2.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk2.ent
    cp $srcdir/ent/isogrk3.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk3.ent
    cp $srcdir/ent/isogrk4.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk4.ent
    cp $srcdir/ent/isolat1.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-lat1.ent
    cp $srcdir/ent/isolat2.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-lat2.ent
    cp $srcdir/ent/isonum.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-num.ent
    cp $srcdir/ent/isopub.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-pub.ent
    cp $srcdir/ent/isotech.ent $pkgdir/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-tech.ent
   
}
