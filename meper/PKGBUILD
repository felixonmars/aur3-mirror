# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=meper
pkgver=1.0
pkgrel=1
pkgdesc="MetaPost editor and previewer"
url="http://cseweb.ucsd.edu/~s1pan/MEPer/"
arch=('any')
license=('GPL')
depends=('java-runtime' 'imagemagick' 'ghostscript')
source=('http://cseweb.ucsd.edu/~s1pan/MEPer/MEPer.jar')
noextract=('MEPer.jar')
md5sums=('9402506d29078796ebe2f25aa2d6cf3d')


build() {
	cd ${srcdir}
	install -D -m644 MEPer.jar ${pkgdir}/usr/share/java/meper/MEPer.jar
	cat >launcher.sh <<EOF_LAUNCHER
#!/bin/sh

\$JAVA_HOME/bin/java -jar /usr/share/java/meper/MEPer.jar "\$@"
EOF_LAUNCHER
	install -D -m755 launcher.sh ${pkgdir}/usr/bin/meper
}
