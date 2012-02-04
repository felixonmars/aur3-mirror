# Contributor: aggaZ <aggaz@paranoici.org>

pkgname=raitranslator
pkgver=1.51
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Rai URL to MMS translator."
depends=('java-runtime')
makedepends=('unzip')
url="http://diy-fever.com/index.php?project=software"
license=('custom:CC BY-NC-SA 3.0 Unported')
source=("http://www.dariocorsetti.com/index.php?option=com_jooget&Itemid=0&task=dl&f=raitranslator-1.51.zip&no_html=1")
md5sums=('addd97315278ce02d0b6e9e217fc18da')

build() {
  mkdir -p $pkgdir/usr/share
  cp -R $srcdir/RaiTranslator $pkgdir/usr/share/
  
  mkdir -p $pkgdir/usr/bin
  cat <<EOF > ${pkgdir}/usr/bin/$pkgname
#!/bin/bash
cd /usr/share/RaiTranslator
java -jar RaiTranslator.jar
EOF
  chmod 755 ${pkgdir}/usr/bin/$pkgname

mkdir -p $pkgdir/usr/share/licenses/$pkgname
cp $startdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

