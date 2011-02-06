# Contributor: Gilfran Ribeiro <contato at gilfran.net> 

pkgname=jsms
pkgver=3.11
pkgrel=1
license=('GPL')
pkgdesc="A Java-based application for sending SMS messages through Brazilian mobile phone operators"
arch=('i686' 'x86_64')
url="http://jsms.com.br/"
depends=('jre')
source=('http://jsms.com.br/download/jSMS-311.jar'
		'http://www.gilfran.net/gil/archpkg/jSMS.png'
		'http://www.gilfran.net/gil/archpkg/jsms.desktop')
noextract=(jSMS-311.jar)
md5sums=('08e899dd6b56f98cb4f0fb35526b3f3e'
		 'b4b76a7acde6395afb9562d9b8b9f303'
		 '19c8ff5b5678d95eecd2a3751989c62e')

build() {
cd $startdir/
install -d $startdir/pkg/usr/share/$pkgname
install -d $startdir/pkg/usr/bin
install -d $startdir/pkg/usr/share/applications
install -d $startdir/pkg/usr/share/pixmaps

install jSMS.png $startdir/pkg/usr/share/pixmaps
install jsms.desktop $startdir/pkg/usr/share/applications
install jSMS-311.jar $startdir/pkg/usr/share/$pkgname

cat > $startdir/src/$pkgname << EOF
#!/bin/sh
export AWT_TOOLKIT=MToolkit
java -jar /usr/share/$pkgname/jSMS-311.jar $@
EOF

install -m 755 $startdir/src/$pkgname $startdir/pkg/usr/bin/$pkgname

}
