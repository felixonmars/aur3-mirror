# Contributor: George Giorgidze <giorgidze (at) gmail.com>

pkgname=rml
pkgver=2.3.8.svn.147
pkgrel=1
pkgdesc="Relational Meta-Language (RML) and Tools, A System for Developing, Compiling and Debugging and Teaching Structural Operational Semantics (SOS) and Natural Semantics Specifications"
arch=('i686' 'x86_64')
url="http://www.ida.liu.se/~pelab/rml/"
license=('custom')
groups=()
depends=('gmp')
makedepends=('mlton')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://openmodelica.ida.liu.se:8080/cb/displayDocument/${pkgname}-mmc_${pkgver}.orig.tar.gz?doc_id=1297)
noextract=()
md5sums=('2f6aa7978a6a44af3601d36c1be92994')

build() {
  cd "${srcdir}/${pkgname}-mmc-${pkgver}"

  sed  --in-place -e '6s/SMLCM=/SMLCM=mlton/'    configure
  sed  --in-place -e '7s/MLLEX=/MLLEX=mllex/'    configure
  sed  --in-place -e '8s/MLYACC=/MLYACC=mlyacc/' configure

  make distclean

  ./configure  --prefix="${pkgdir}/opt/rml" --disable-debug --disable-profile

  make 
  make install
  sed  --in-place -e '3c\PREFIX=/opt/rml' "${pkgdir}/opt/rml/bin/rmlc"
  
  cd 'compiler'
  mlton -verbose 3 -target self rml.mlb
  cd ..

  install -D -m755 compiler/rml  "${pkgdir}/opt/rml/bin/rml"
  install -D -m644 'COPYRIGHT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
