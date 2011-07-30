# Original Contributor: AqD <aquila.deus@gmail.com>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>

pkgname=jrockit-jdk
pkgver=1.6.0_26
filever=R28.1.4-4.0.1
pkgrel=2
pkgdesc="JRockit is a high performace JVM"
url="http://www.oracle.com/technetwork/middleware/jrockit/"
depends=('alsa-lib' 'unixodbc' 'libxtst' 'gtk2')
replaces=('jdk' 'j2sdk' 'java-environment' 'j2re' 'java-runtime' 'jre')
provides=('jdk=6' 'j2sdk' 'java-environment' 'j2re' 'java-runtime' 'jre=6')
license=('custom')
arch=('i686' 'x86_64')
install=${pkgname}.install
options=(!strip !zipman)

source=(
	installer.bin::http://download.oracle.com/otn/bea/jrockit/jrockit-jdk1.6.0_26-R28.1.4-4.0.1-linux-x64.bin
	license.html
	${pkgname}.profile
	silent.xml
)

md5sums=(
	'39b92834e1ed029425cd68706dd5f914'
	'9212c2dbe1fefa6cea5163497661d704'
	'83556c506af39ae5956a0713b9bd98cc'
	'cb117b969a643a2ed7b9f10d5afba44c'
)

if test "$CARCH" == i686; then
	source[0]=installer.bin::http://download.oracle.com/otn/bea/jrockit/jrockit-jdk1.6.0_26-R28.1.4-4.0.1-linux-ia32.bin
	md5sums[0]=`md5sum installer.bin`
fi

build() {
	mkdir -p $startdir/pkg/opt/java
	cd $pkgdir/opt/java
	chmod 755 $startdir/src/installer.bin
	$srcdir/installer.bin -mode=silent -silent_xml=$startdir/src/silent.xml || return 1
	mkdir -p $pkgdir/usr/bin
	cd $pkgdir/usr/bin
	for b in `ls -1 ../../opt/java/bin/`; do ln -sf "../../opt/java/bin/$b"; done;
	cd $startdir/src
	install -D -m755 ${pkgname}.profile $startdir/pkg/etc/profile.d/${pkgname}.sh
	install -D -m 644 $startdir/src/license.html $startdir/pkg/usr/share/licenses/$pkgname/license.html
}
