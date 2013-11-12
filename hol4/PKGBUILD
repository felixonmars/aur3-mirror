# maintainer: perlawk
pkgname=hol4
pkgver=8
_pkgver=kananaskis
pkgrel=2
pkgdesc="HOL4 is the latest version of the HOL interactive proof assistant for higher order logic."
url='http://hol.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('mosml')
source=("http://downloads.sourceforge.net/project/hol/hol/${_pkgver}-${pkgver}/${_pkgver}-${pkgver}.tar.gz")
install=hol.install
options=(!strip)

build() {
	optdir=${srcdir}/hol-${_pkgver}-${pkgver}

	echo optdir = ${optdir}

	cd ${optdir}/

 # echo "val holdir = \"${optdir}\"" >  config-override
	#echo "val mosmldir = \"/usr/bin\"" >>  config-override
	#mosml < tools/smart-configure.sml
 # bin/build 
}

package() {
	optdir=${srcdir}/hol-${_pkgver}-${pkgver}
	mkdir -p ${pkgdir}/usr/lib/hol/bin
	mkdir -p ${pkgdir}/usr/bin

	cd ${optdir}/bin
	cp  Holmake unquote  ${pkgdir}/usr/lib/hol/bin
	cd ../
	cp  -a sigobj src std.prelude help tools ${pkgdir}/usr/lib/hol/
	mkscript
	chmod a+x ${pkgdir}/usr/lib/hol/bin/hol ${pkgdir}/usr/lib/hol/bin/hol.noquote
}

mkscript() {
	cat > $pkgdir/usr/lib/hol/bin/hol <<HERE
	#!/bin/sh
	HD=/usr/lib/hol
	HDB=\${HD}/bin
	HDT=\${HD}/tools
	\${HDB}/unquote | /usr/bin/mosml -quietdec -P full -I \${HD}/sigobj \${HD}/std.prelude \${HDT}/unquote-init.sml \$* \${HDT}/end-init-boss.sml
HERE

	cat > $pkgdir/usr/lib/hol/bin/hol.noquote <<HERE
#!/bin/sh
	HD=/usr/lib/hol
	HDB=\${HD}/bin
	HDT=\${HD}/tools
/usr/bin/mosml -quietdec -P full -I \${HD}/sigobj \${HD}/std.prelude \$* \${HDT}/end-init-boss.sml
HERE
}



md5sums=('c1cf6efbc7a2e29a2a7b6f4336d3ae2e')
