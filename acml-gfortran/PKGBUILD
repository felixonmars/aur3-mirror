# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=acml-gfortran
pkgver=5.1.0
pkgrel=1
pkgdesc="AMD Core Math Library (ACML) for Linux built with GFORTRAN"
arch=("x86_64")
url="http://developer.amd.com"
license=(custom)
depends=("gcc-libs-multilib" "bash" "tcsh")
makedepends=("sed")
md5sums=('9408a9093d24199e127b66e92623ecc1')

source=("http://download2-developer.amd.com/amd/ACML/acml-5-1-0-gfortran-64bit.tgz")

build() {
	installdir=/opt/acml
	sed -i s^\#\ Edit\ any\ example^fullpathinstalldir\=\"$installdir\"\\n\#\ Edit\ any\ example^g $srcdir/install-acml-5-1-0-gfortran-64bit.sh
	sed -i s^/opt/acml-5-1-0^/opt/acml^g $srcdir/install-acml-5-1-0-gfortran-64bit.sh
	sed -i s^fpgnumakefile\=^fpgnumakefile\=${pkgdir}^g $srcdir/install-acml-5-1-0-gfortran-64bit.sh
	sh $srcdir/install-acml-5-1-0-gfortran-64bit.sh -acceptlicense=1 -installdir=$pkgdir$installdir
	mkdir -p $pkgdir/usr/share/licenses/acml
	mv $pkgdir/opt/acml/ACML-EULA.txt $pkgdir/usr/share/licenses/acml/LICENSE
	rm -rf $pkgdir/opt/acml/Doc
	rm -rf $pkgdir/opt/acml/util
	rm -f $pkgdir/opt/acml/ReleaseNotes
}
