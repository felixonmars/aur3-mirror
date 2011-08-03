# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=xmlresume
pkgver=1.5.1
pkgrel=2
pkgdesc="An XML DTD and XSL file set for declaration, B2B exchange, and presentation of resumes."
arch=('any')
url="http://xmlresume.sourceforge.net/"
license=('custom')
depends=('libxslt')
optdepends=('java-runtime: filter resume to target' 
            'fop: render to PDF'
            'sgml-common: use DTD locally rather than fetching over network')
source=(Makefile http://prdownloads.sourceforge.net/xmlresume/resume-1_5_1.tgz)

md5sums=('58141a39f9e4714a4f23521c36947678'
         '799b78f4ffcfd14da46ffa03865a9a45')

build() {
  install -D -m644 Makefile $pkgdir/usr/share/xsl/resume/Makefile
  cd $srcdir/resume-1_5_1
  sed -i -e 's|\.\./\.\./css|css|' xsl/params.xsl
  sed -i -e 's|overflow="hidden"||' xsl/format/fo.xsl
  install -d -m755  $pkgdir/usr/share/xml/resume
  cp -R dtd/* $pkgdir/usr/share/xml/resume
  cp -R xsl/* $pkgdir/usr/share/xsl/resume
  cp -R css $pkgdir/usr/share/xsl/resume/format
  install -D -m644  java/xmlresume-filter.jar $pkgdir/usr/share/java/resume/xmlresume-filter.jar
  install -D -m644 doc/copying/index.html $pkgdir/usr/share/licenses/$pkgname/index.html
}

# vim:set ts=2 sw=2 et:
