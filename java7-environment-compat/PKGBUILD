# Maintainer:  Mattias Andrée

pkgname=java7-environment-compat
pkgver=7.21.11
pkgrel=1
_ver=7u21
_build=b11
_docver=7u21
_docbuild=b11
pkgdesc='Java 7 Development Kit that can be install alongside any other version, includes extracted library source code, Java API in HTML and some /usr/bin/*7 commands'
url=http://www.oracle.com/technetwork/java/javase/downloads/index.html
arch=(i686 x86_64)
license=(custom)
makedepends=(unzip)
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --header "Cookie:oraclelicensejdk-${_ver}-oth-JPR=accept-securebackup-cookie;gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk${_ver}-downloads-1836413.html"')
source=("http://download.oracle.com/otn-pub/java/jdk/$_ver-$_build/jdk-$_ver-linux-x64.tar.gz"
	"http://download.oracle.com/otn-pub/java/jdk/$_docver-$_docbuild/jdk-$_docver-apidocs.zip")
sha384sums=(cdec2160f3dd6c2fced60e6a0a1837d6baf4aef4e8d7cc138015480184d8c15a7ab714951b66a7cf8ee66ca9f32b1c88
	    dbc3d0d101f6861fb88f1411deded41cfd7e9df58fe0b6a6ef522394cf4a129829773810eb34d19da5198a9db1c127b0)

## javase: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
## apidoc: http://www.oracle.com/technetwork/java/javase/documentation/java-se-7-doc-download-435117.html

[ "${CARCH}" == 'i686' ] &&
  source[0]="http://download.oracle.com/otn-pub/java/jdk/$_ver-$_build/jdk-$_ver-linux-i586.tar.gz" &&
  sha384sums[0]=946a87b167b94e3f876535b2d54684060d74fdedf00568abd9e6e337a56e2937eca74a4abf4f21279854029355dfa0a4

_binfiles="appletviewer jar jarsigner java javac javadoc javah javap jdb serialver"

build()
{
	msg "Extracting library source code"
	cd $srcdir/jdk1.7.*
	mkdir src
	mv src.zip src
	cd src
	unzip src.zip
	unlink src.zip
}

package()
{
	msg "Correcting file structure"
	mkdir -p $pkgdir/opt/jdk7
	mv $srcdir/* $pkgdir/opt/jdk7
	unlink $pkgdir/opt/jdk7/jdk-*-apidocs.zip
	unlink $pkgdir/opt/jdk7/jdk-*-linux-*.tar.gz
	mv $pkgdir/opt/jdk7/jdk1.7.*/* $pkgdir/opt/jdk7
	rmdir $pkgdir/opt/jdk7/jdk1.7.*
	mkdir -p $pkgdir/usr/bin
	
	msg "Making command symlinks to /usr/bin/"
	for file in $_binfiles; do
	    echo "Making link /usr/bin/${file}7 -> /opt/jdk7/bin/${file}"
	    ln -s /opt/jdk7/bin/${file} $pkgdir/usr/bin/${file}7
	done
}
