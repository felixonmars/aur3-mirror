# Contributor: George Giorgidze <giorgidze (at) gmail.com>

pkgname=openmodelica
pkgver=1.4.5
pkgrel=1
pkgdesc="The Open Source Modelica Compiler"
arch=('i686' 'x86_64')
url="http://www.ida.liu.se/labs/pelab/modelica/OpenModelica.html"
license=('custom')
groups=()
depends=('gcc-libs' 'bash')
makedepends=('antlr' 'rml' 'openjdk6')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://openmodelica.ida.liu.se:8080/cb/displayDocument/${pkgname}_${pkgver}.orig.tar.gz?doc_id=1318)
noextract=()
md5sums=('359a5a601152b2e101273401786416f0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}+svn3828"
  RMLHOME="/opt/rml" ANTLRHOME="/usr" CLASSPATH="/usr/share/java/antlr.jar" ./configure --prefix=/opt/openmodelica --without-CORBA --without-MODPAR --without-BOOST
  CLASSPATH="/usr/share/java/antlr.jar" make omc
  make prefix="${pkgdir}/opt/openmodelica/" install
  install -D -m644 'OSMC-License.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm ${pkgdir}/opt/openmodelica/lib/*mingw.a
}
