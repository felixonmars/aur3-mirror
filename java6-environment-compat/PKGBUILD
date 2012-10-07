# Maintainer:  Mattias Andrée

pkgname=java6-environment-compat
pkgver=6.35.10
pkgrel=1
_ver=6u35
_build=b10
_docver=6u30
_docbuild=b12
pkgdesc='Java 6 Development Kit that can be install alongside any other version, includes extracted library source code, Java API in HTML and some /usr/bin/*6 commands'
url=http://www.oracle.com/technetwork/java/javase/downloads/index.html
arch=(i686 x86_64)
license=(custom)
makedepends=(unzip)
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --header "Cookie:oraclelicensejdk-${_ver}-oth-JPR=accept-securebackup-cookie;gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk${_ver}-downloads-1836443.html"')
source=("http://download.oracle.com/otn-pub/java/jdk/$_ver-$_build/jdk-$_ver-linux-x64.bin"
	"http://download.oracle.com/otn-pub/java/jdk/$_docver-$_docbuild/jdk-$_docver-apidocs.zip")
md5sums=(3876e012629977ce08054347cf3bfdb0 bb70bdc15b4ec322191660c90adb99ba)

[ "${CARCH}" == 'i686' ] &&
  source[0]="http://download.oracle.com/otn-pub/java/jdk/$_ver-$_build/jdk-$_ver-linux-i586.bin" &&
  md5sums[0]=592b60fcc11cbd6d323a3f357327d701

_binfiles="appletviewer jar jarsigner java javac javadoc javah javap jdb serialver"

build()
{
	msg "Extracting binaries"
	cd $srcdir
	chmod a+x jdk-*.bin
	./jdk-*.bin -noregister
	unlink jdk-*.bin
	cd jdk1.6.*
	
	msg "Extracting library source code"
	mkdir src
	mv src.zip src
	cd src
	unzip src.zip
	unlink src.zip
}

package()
{
	msg "Correcting file structure"
	mkdir -p $pkgdir/opt/jdk6
	mv $srcdir/* $pkgdir/opt/jdk6
	unlink $pkgdir/opt/jdk6/jdk-*-apidocs.zip
	mv $pkgdir/opt/jdk6/jdk1.6.*/* $pkgdir/opt/jdk6
	rmdir $pkgdir/opt/jdk6/jdk1.6.*
	mkdir -p $pkgdir/usr/bin
	
	msg "Making command symlinks to /usr/bin/"
	for file in $_binfiles; do
	    echo "Making link /usr/bin/${file}6 -> /opt/jdk6/bin/${file}"
	    ln -s /opt/jdk6/bin/${file} $pkgdir/usr/bin/${file}6
	done
}
