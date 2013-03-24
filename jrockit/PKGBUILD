# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: AqD <aquila.deus@gmail.com>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>

pkgname=jrockit
_java_version=1.6.0_37
_jrockit_version=28.2.5
_jrmc_version=4.1.0
pkgver=${_jrockit_version}
pkgrel=1
pkgdesc="A high performace JVM from Oracle"
url="http://www.oracle.com/technetwork/middleware/jrockit/"
provides=('java-environment=6' 'java-runtime=6' 'java-runtime-headless=6')
depends=('libxtst' 'libxt' 'unixodbc' 'alsa-lib')
conflicts=('java-environment' 'java-runtime' 'java-runtime-headless')
license=('custom')
arch=('i686' 'x86_64')
install=${pkgname}.install
options=(!strip !zipman emptydirs)
source=("LICENSE" "${pkgname}.profile" "silent.xml")
md5sums=('95649412a93ff83442e246d2661af769'
         '83556c506af39ae5956a0713b9bd98cc'
         'cb117b969a643a2ed7b9f10d5afba44c')

if [ "$CARCH" = "x86_64" ]; then
	_installerarch="x64"
	_installermd5sum=('07cdb8b85f5393378511c5e1aa1bef35')
else
	_installerarch="ia32"
	_installermd5sum=('50b63adb2d6eb896b3948bda92fbc7ab')
fi
_installer=jrockit-jdk${_java_version}-R${_jrockit_version}-${_jrmc_version}-linux-${_installerarch}.bin

_help() {
	msg "Please do the following:"
	msg " 1) Go to http://www.oracle.com/technetwork/middleware/jrockit/downloads/"
	msg " 2) Download ${_installer} (requires login)"
	msg " 3) Place downloaded file in $srcdir"
	msg " 4) Try building this package again"
	return 1
}

build() {
	cd "$srcdir"
	if [ ! -f ${_installer} ]; then
		_help
	fi
	if [ `md5sum ${_installer} | sed "s/\ .*//"` != ${_installermd5sum} ]; then
		msg "MD5SUM of ${_installer} does not match expected value, try downloading the file again"
		_help
	fi
	chmod 755 "${_installer}"
}

package() {
	mkdir -p "$pkgdir"/opt/jrockit
	cd "$pkgdir"/opt/jrockit
	"$srcdir"/${_installer} -mode=silent -silent_xml="$srcdir"/silent.xml

	mkdir -p "$pkgdir"/usr/lib/mozilla/plugins
	if [ "$CARCH" = "i686" ]; then
		ln -s /opt/jrockit/jre/lib/i386/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins
	else 
		ln -s /opt/jrockit/jre/lib/amd64/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins
	fi

	install -D -m755 "$srcdir"/${pkgname}.profile "$pkgdir"/etc/profile.d/${pkgname}.sh

	install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

