# Zbynek Moravec <zbynek@ithvezda.cz>

pkgname=filecast
pkgver=1.0
pkgrel=1
pkgdesc='Personal webserver for simple file sharing'
arch=('any')
license=("https://www.apache.org/licenses/LICENSE-2.0.html")
url="http://www.onyxbits.de/filecast"
depends=('java-runtime')
jarFile="filecast-1.0.jar"
noextract=("$jarFile")
source=(
	"http://www.onyxbits.de/sites/default/files/download/339/$jarFile"
	$pkgname.desktop
)

sha1sums=('74b20e7ad3456ca660ce78950d7406132f321157' '3b03653d26192776943d82d975c9e75ecafcbf16')

package() {
	cd ${srcdir}/

	install -d ${pkgdir}/usr/share/java/$pkgname
	cp ${srcdir}/${jarFile} ${pkgdir}/usr/share/java/$pkgname/

	#.desktop
	install -D -m644 ${srcdir}/$pkgname.desktop \
		${pkgdir}/usr/share/applications/$pkgname.desktop
		
	#icon	
	mkdir -p ${pkgdir}/usr/share/pixmaps/			
	jar xf ${srcdir}/filecast-1.0.jar 	
	install -Dm644 appicon-96.png ${pkgdir}/usr/share/pixmaps/$pkgname.png

#executable file
	install -d ${pkgdir}/usr/bin
	cat > ${pkgdir}/usr/bin/$pkgname << EOF
#!/bin/sh
cd /usr/share/java/$pkgname/
exec java -jar ${jarFile} \$@
EOF

	chmod 775 ${pkgdir}/usr/bin/$pkgname
}
