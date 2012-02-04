# Maintainer: Max Roder <maxroder@web.de>

pkgname=jaolt-svn
pkgver=1080
pkgrel=1
pkgdesc="java auction management tool for ebay, auvito and hood"
arch=('any')
url="http://code.google.com/p/jaolt/"
license=('LGPL' 'CDDL'  'APACHE' 'BSD' 'CCPL:by' 'custom:H2' 'custom:jdom' 'custom:jgoodies')
#depends=('hsqldb-java' 'java-runtime' 'java-jdom' 'jgoodies-looks' 'jgoodies-forms')
depends=('java-runtime')
makedepends=('apache-ant' 'subversion')
provides=('jaolt')
conflicts=('jaolt')
source=('jaolt.patch'
		'license-instructions.txt.patch')
md5sums=('b4196d667726ae8a1ca6595bd5a68f39'
	'd0e9cb633b758a03fb8c7c954f70c1c9')

_svntrunk='http://jaolt.googlecode.com/svn/trunk'
_svnmod='jaolt'

build() {
	cd ${srcdir}

	msg2 "Connecting to SVN server...."

	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r $pkgver)
	else
		svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
	fi

	msg2 "SVN checkout done or server timeout"
	msg2 "Starting build..."

	# Remove old source files first, if present
	rm -rf ${_svnmod}-build
	svn export ${_svnmod} ${_svnmod}-build
	cd ${_svnmod}-build

	msg2 "Compiling using apache-ant"
	/usr/share/java/apache-ant/bin/ant
}

package() {
	cd ${_svnmod}-build

	# Remove .svn directories
	rm -rf `find "$pkgdir" -type d -name ".svn"`

	#patch -N -i ../jaolt.patch
	#patch -N -i ../license-instructions.txt.patch

	sed -i 's/launcher.jar/\/usr\/share\/java\/jaolt\/launcher.jar/g' jaolt

	# Copying license files
	install -d ${pkgdir}/usr/share/licenses/jaolt
	mv jgoodies-uiflite.txt ${pkgdir}/usr/share/licenses/jaolt/LICENSE.jgoodies
	mv license-instructions.txt ${pkgdir}/usr/share/licenses/jaolt/readme

	msg2 "Copying files"
	install -d ${pkgdir}/usr/share/java/jaolt/ ${pkgdir}/usr/share/applications/ ${pkgdir}/usr/share/pixmaps/
	mv jaolt.desktop ${pkgdir}/usr/share/applications/
	mv jaolt.xpm ${pkgdir}/usr/share/pixmaps/

	# Removing unnecessary libs
	#rm -rf lib/forms*.jar lib/h2*.jar lib/jdom*.jar lib/looks*.jar
	
	# Removing unnecessary files, copy anything else
	install -Dm755 jaolt ${pkgdir}/usr/bin/jaolt
	rm -rf bin/ build* changelog.txt jaolt lgpl.txt src/ jgoodies-forms.txt jgoodies-looks.txt legacy/ h2.txt jdom.txt
	cp -r * ${pkgdir}/usr/share/java/jaolt/

	# Clean up
	cd .. && rm -rf ${srcdir}/${_svnmod}-build
}
