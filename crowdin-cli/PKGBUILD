# Maintainer: Nico Alt <nicoalt at posteo dot org>

pkgname=crowdin-cli
pkgver=0.4.1
pkgrel=3
pkgdesc="Access Continuous Localization With Crowdin"
arch=('any')
url="https://crowdin.com/page/cli-tool"
license=('MIT')
depends=('java-runtime>=7' 'wget')
_srcURL="https://crowdin.com/downloads/$pkgname.jar"

build() {
	wget $_srcURL -O $srcdir/$pkgname.jar
}

package() {
	# Copy .jar to /usr/share/java/
	install -d $pkgdir/usr/share/java/$pkgname
	install $srcdir/$pkgname.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
	
	# Generate executable file in /usr/bin
	install -d $pkgdir/usr/bin
	echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
	echo "exec /usr/bin/java -jar '/usr/share/java/crowdin-cli/crowdin-cli.jar' \"$@\"" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}
