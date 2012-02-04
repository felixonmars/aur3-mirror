# Contributer: N30N <archlinux@alunamation.com>

pkgname="css-validator-cvs"
pkgver=20111205
pkgrel=1
pkgdesc="Command line version of the W3C's CSS validator"
url="http://jigsaw.w3.org/css-validator/documentation.html"
license="Apache"
arch=("i686" "x86_64")
depends=("java-runtime")
# makedepends=("cvs" "apache-ant" "tomcat")
makedepends=("cvs" "apache-ant")
source=("css-validator.sh" \
	"http://jigsaw.w3.org/Distrib/jigsaw_2.2.6.tar.gz" \
	"http://www.apache.org/dist/commons/collections/binaries/commons-collections-3.2.1-bin.zip" \
	"http://www.apache.org/dist/commons/lang/binaries/commons-lang-2.6-bin.zip" \
	"http://www.apache.org/dist/velocity/engine/1.7/velocity-1.7.tar.gz" \
	"http://www.apache.org/dist/xerces/j/binaries/Xerces-J-bin.2.11.0.tar.gz" \
	"http://mirrors.ibiblio.org/pub/mirrors/maven2/jetty/servlet-api/2.5-6.0.0/servlet-api-2.5-6.0.0.jar" \
	"http://about.validator.nu/htmlparser/htmlparser-1.3.1.zip" \
)
md5sums=("4062f65be015b900ada6d6793c02ff88" \
	"c848e06d7851ca0d243fd8bdef4c7765" \
	"23925dbfaf3c266b487c264c1a643b51" \
	"09c4bd0122f2193f01e2ac898bf1072c" \
	"6af13ea297dee7ddbabeaa8e3963c184" \
	"29d731e0ae57eb3f2e09af6594bc2515" \
	"c27c02fb0a00cc3a7d05ea993a9bf56e" \
	"dbbc49666b72426e4f79990c88485d61" \
)
noextract=("jigsaw_2.2.6.tar.gz" \
	"commons-collections-3.2.1-bin.zip" \
	"commons-lang-2.6-bin.zip" \
	"velocity-1.7.tar.gz" \
	"Xerces-J-bin.2.11.0.tar.gz" \
	"servlet-api-2.5-6.0.0.jar" \
	"htmlparser-1.3.1.zip" \
)
provides=("css-validator")
conflicts=()

_cvsroot=":pserver:anonymous:anonymous@dev.w3.org:/sources/public"
_cvsmod="2002/css-validator"

build() {
	cd "${srcdir}"
	msg "Connecting to W3C's CVS server......."
	if [ -d ${_cvsmod}/CVS ]; then
		(cd ${_cvsmod} && cvs -z3 update -d && ant clean)
	else
		cvs -z3 -d ${_cvsroot} co -D ${pkgver} -f ${_cvsmod}
	fi

	cd ${_cvsmod}
	mkdir tmp
	for file in ${srcdir}/*.{gz,zip,jar}; do
		cp ${file} tmp
	done

	msg "Starting build process."
	# export CLASSPATH=/opt/tomcat/common/lib/servlet-api.jar
	ant

	install -D -m755 ${srcdir}/css-validator.sh ${pkgdir}/usr/bin/css-validator
	install -D -m644 css-validator.jar \
		${pkgdir}/usr/share/java/css-validator/css-validator.jar
	for file in lib/*.jar; do
		install -D -m644 ${file} ${pkgdir}/usr/share/java/css-validator/${file}
	done
}
