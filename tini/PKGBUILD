
# Contributor: Yannick Poirier <contact@yannickpoirier.fr>
pkgname=tini
pkgver=1.18
pkgrel=4
pkgdesc="TINI runtime environment for the DS80C400 Network Microcontroller"
arch=('i686')
url="http://www.maxim-ic.com/products/microcontrollers/tini/"
license=("Dallas Semiconductor")
groups=()
depends=("java-comm")
makedepends=()
provides=("tini_convertor" "tini_javaKit")
conflicts=()
replaces=()
backup=()
install=
source=("http://files.dalsemi.com/pub/tini/${pkgname}1_18.tgz")
noextract=()
md5sums=(4f117d2052790748fdfb575635a7c818) 

build() {

    #create script to launch "tini_convertor"
    echo "#!/bin/bash

	FILE_NAME=\$1
	PATH_TINI=/usr/share/java/$pkgname

	export CLASSPATH=\$CLASSPATH:/lib/ext/comm.jar:/lib/javax.comm.properties
	java -classpath \${PATH_TINI}/tini.jar:\$CLASSPATH  TINIConvertor \\
		-f \${FILE_NAME} \\
		-d \${PATH_TINI}/tini.db \\
		-o \${FILE_NAME%.*}.tini " > "$srcdir/${pkgname}_convertor"

  #create script to launch "tini_javaKit"
  echo "#!/bin/bash

	PATH_TINI=/usr/share/java/$pkgname

	export CLASSPATH=\$CLASSPATH:/lib/ext/comm.jar:/lib/javax.comm.properties
	java -classpath \${PATH_TINI}/tini.jar:\$CLASSPATH JavaKit -400 -flash 40" > "$srcdir/${pkgname}_javaKit"


  install -v -d "$pkgdir/usr/share/java/$pkgname" || return 1
  install -v -d "$pkgdir/usr/share/licenses/$pkgname" || return 1
  install -v -d "$pkgdir/usr/share/doc/$pkgname" || return 1
  install -v -d "$pkgdir/usr/share/$pkgname" || return 1
  install -v -d "$pkgdir/usr/share/$pkgname/bin" || return 1
  install -v -d "$pkgdir/usr/bin" || return 1

  install -D -m755 -v $srcdir/${pkgname}${pkgver}/bin/*.jar "$pkgdir/usr/share/java/$pkgname/"  
  install -D -m755 -v $srcdir/${pkgname}${pkgver}/bin/tini.db "$pkgdir/usr/share/java/$pkgname/"  
  install -D -m755 -v $srcdir/${pkgname}${pkgver}/License.txt "$pkgdir/usr/share/licenses/$pkgname/"  
  install -D -m755 -v $srcdir/${pkgname}${pkgver}/README.txt "$pkgdir/usr/share/$pkgname/"  
  install -D -m755 -v $srcdir/${pkgname}${pkgver}/bin/*.{tbin,txt} "$pkgdir/usr/share/$pkgname/bin"  

  install -D -m755 -v $srcdir/${pkgname}_javaKit "$pkgdir/usr/bin"  
  install -D -m755 -v $srcdir/${pkgname}_convertor "$pkgdir/usr/bin"  

  cp -r  $srcdir/${pkgname}${pkgver}/docs/* "$pkgdir/usr/share/doc/$pkgname"  
  cp -r  $srcdir/${pkgname}${pkgver}/examples "$pkgdir/usr/share/$pkgname"    
  cp -r  $srcdir/${pkgname}${pkgver}/native "$pkgdir/usr/share/$pkgname"  
 

}

