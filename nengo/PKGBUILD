# Maintainer: Reverland <lhtlyy[at]gmail[dot]com>

pkgname=nengo
pkgver=1.4
pkgrel=2
pkgdesc="A graphical and scripting based software package for simulating large-scale neural systems."
depends=('java-runtime')
optdepends=('python2-scipy' 'python2-numpy' 'cuda')
options=('!strip')
source=('http://ctnsrv.uwaterloo.ca:8080/jenkins/job/Nengo%201.4/lastSuccessfulBuild/artifact/nengo-1.4.zip')
url="http://www.nengo.ca"
license=('MPL')
arch=('any')

md5sums=('d5505eeec74339e0d341a802f347213c')

build(){
	return 0
}
package() {
	cd $srcdir/nengo-5f37d63

	echo "Installing nengo..."

	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
 	cp $srcdir/nengo-5f37d63/license.txt $pkgdir/usr/share/licenses/$pkgname

	mkdir -p $pkgdir/opt/ 
	mv $srcdir/nengo-5f37d63 $pkgdir/opt/$pkgname

	mkdir -p $pkgdir/opt/$pkgname/lib/cachedir/packages

	mkdir -p $pkgdir/usr/bin
	cat >> $pkgdir/usr/bin/$pkgname << EOF
	#!/usr/bin/env bash
	
	cd /opt/nengo
	java -Dpython.cachedir=/tmp/nengo -Xms100m -Xmx800m -cp .:nengo-5f37d63.jar:lib/Blas.jar:lib/itextpdf-5.3.4.jar:lib/jnumeric-0.1.jar:lib/macify-1.4.jar:lib/jayatana-1.2.4.jar:lib/colt.jar:lib/commons-collections-3.2.jar:lib/formsrt.jar:lib/Jama-1.0.2.jar:lib/jcommon-1.0.0.jar:lib/jfreechart-1.0.1.jar:lib/jmatio.jar:lib/jung-1.7.6.jar:lib/jython.jar:lib/log4j-1.2.16.jar:piccolo.jar:lib/piccolox.jar:lib/qdox-1.6.3.jar:lib/ssj.jar:lib/jgrapht-jdk1.5-0.7.3.jar -Djava.library.path=NengoGPU:NengoUtilsGPU ca.nengo.ui.NengoLauncher
EOF
 
	chmod a+x $pkgdir/usr/bin/$pkgname

	cat >> $pkgdir/usr/bin/nengo-cl << EOF
	#!/usr/bin/env bash

	cd /opt/nengo
	java -Dpython.cachedir=/tmp/nengo -Xms100m -Xmx800m -cp .:nengo-5f37d63.jar:lib/Blas.jar:lib/itextpdf-5.3.4.jar:lib/jnumeric-0.1.jar:lib/macify-1.4.jar:lib/jayatana-1.2.4.jar:lib/colt.jar:lib/commons-collections-3.2.jar:lib/formsrt.jar:lib/Jama-1.0.2.jar:lib/jcommon-1.0.0.jar:lib/jfreechart-1.0.1.jar:lib/jmatio.jar:lib/jung-1.7.6.jar:lib/jython.jar:lib/log4j-1.2.16.jar:piccolo.jar:lib/piccolox.jar:lib/qdox-1.6.3.jar:lib/ssj.jar:lib/jgrapht-jdk1.5-0.7.3.jar -Djava.library.path=NengoGPU:NengoUtilsGPU org.python.util.jython ./python/startup_cl.py $@
EOF

	chmod a+x $pkgdir/usr/bin/nengo-cl

	# add nengo.log
	cat>>$pkgdir/opt/$pkgname/nengo.log<<EOF
EOF
	chmod 777 $pkgdir/opt/$pkgname/nengo.log
} 
