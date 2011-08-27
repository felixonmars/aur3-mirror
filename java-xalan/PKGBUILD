# Contributor: Douglas Thrift <douglas@douglasthrift.net>
pkgname=java-xalan
pkgver=2.7.0
pkgrel=1
pkgdesc="XSLT processor for transforming XML documents"
url="http://xml.apache.org/xalan-j/"
depends=('j2re' 'java-xerces2')
source=(http://www.apache.org/dist/xml/xalan-j/xalan-j_2_7_0-bin.tar.gz)
md5sums=('d526d0848c88607ce4e3a0a4edb75d50')

build() {
  mkdir -p $startdir/pkg/usr/share/java/xalan
  cd $startdir/src/xalan-j_2_7_0
  cp *.jar $startdir/pkg/usr/share/java/xalan
}
