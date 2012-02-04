# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-xml-addon
pkgver=1.1.4
pkgrel=2
pkgdesc="addon to parse XML in J programming language"
arch=('any')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware' 'expat')
source=(http://www.jsoftware.com/jal/j602/addons/xml_sax_${pkgver}_linux.tar.gz)
md5sums=('f9b5b82a8af0d3825c925bd3c77d6ff6')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a xml $startdir/pkg/usr/lib/j/addons/
  rm -r $startdir/pkg/usr/lib/j/addons/xml/sax/lib
  rm -r $startdir/pkg/usr/lib/j/addons/xml/sax/src
  mv $startdir/pkg/usr/lib/j/addons/xml/sax/expat.ijs $startdir/pkg/usr/lib/j/addons/xml/sax/expat.ijs.bak
  sed -e "s@LN=.@NB. LN=.@g" -e "s@LL=.@NB. LL=.@g" -e "s@LIB=:@LIB=: '/usr/lib/libexpat.so' NB. LIB=:@g" $startdir/pkg/usr/lib/j/addons/xml/sax/expat.ijs.bak > $startdir/pkg/usr/lib/j/addons/xml/sax/expat.ijs
  rm $startdir/pkg/usr/lib/j/addons/xml/sax/expat.ijs.bak
}
