# contributor: Christian Storm <Christian.Storm@gmx.de>
pkgname=jfig
pkgver=3.0.5
_pkgmajorver=3
pkgrel=1
pkgdesc="a java-based xfig clone"
url="http://tams-www.informatik.uni-hamburg.de/applets/jfig/jfig.html"
license=""
depends=( 'j2re' 'bash' )
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://tams-www.informatik.uni-hamburg.de/applets/$pkgname/archive/$pkgname$_pkgmajorver-itext.jar)
md5sums=('32b071a947e77cdc8cbf7b690a08bc2d')

build() {
  cd $startdir/src/

  install -d $startdir/pkg/opt/$pkgname
  install -d $startdir/pkg/usr/bin

  install $pkgname$_pkgmajorver-itext.jar $startdir/pkg/opt/$pkgname

cat > $startdir/src/$pkgname << EOF
#!/bin/sh
if [ -z \${JAVA_HOME} ]; then
	echo "JAVA_HOME env not set. don't know where to find java..."
	echo "please install j2re and/or set JAVA_HOME correctly"
	exit 1
fi
cd /opt/${pkgname}
\${JAVA_HOME}/bin/java -jar $pkgname$_pkgmajorver-itext.jar
EOF

  install -m 755 $startdir/src/$pkgname $startdir/pkg/usr/bin/$pkgname
}
