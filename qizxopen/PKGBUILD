# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=qizxopen
pkgver=4.1
pkgrel=1
pkgdesc="XML indexing and searching engine, fully supporting XQuery"
url="http://www.axyana.com/qizxopen/"
arch=('any')
license=('MPL')
depends=('java-runtime' 'apache-ant' 'bash')
source=("http://www.axyana.com/${pkgname}/_download/${pkgname}-${pkgver}.zip")
md5sums=('aac7e9a23772632e07e1bc4b2860b568')

build() {
	# Do nothing
	:
}

package() {
	# As the ZIP package does not contain any installer, the files
	# are copied manually
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	# copy the libraries
	cp ${srcdir}/${pkgname}-${pkgver}/lib/*.jar ${pkgdir}/usr/share/java/${pkgname}
	# edit the launcher to use correct paths
	msg "Customizing launcher scripts...";
	mkdir -p ${pkgdir}/usr/bin
	for f in qizx qizxstudio; do
		sed -e 's#dlib=$distrib/lib#'"dlib=/usr/share/java/${pkgname}"'#' \
			<${srcdir}/${pkgname}-${pkgver}/bin/$f \
			>${pkgdir}/usr/bin/$f;
		chmod +x ${pkgdir}/usr/bin/$f;
	done
	# copy the documentation
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
	cp -R ${srcdir}/${pkgname}-${pkgver}/docs \
		${srcdir}/${pkgname}-${pkgver}/README.html \
		${pkgdir}/usr/share/doc/${pkgname}
	find ${pkgdir}/usr/share/doc/${pkgname} ${pkgdir}/usr/share/java/${pkgname}  -type f -exec chmod 0644 {} \;	
	find ${pkgdir}/usr/share/doc/${pkgname} ${pkgdir}/usr/share/java/${pkgname}  -type d -exec chmod 0755 {} \;	
}

