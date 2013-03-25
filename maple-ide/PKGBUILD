# Maintainer: Bayi <bayi@bayi.hu>

pkgname=maple-ide
epoch=1
pkgver=0.0.12
pkgrel=3
pkgdesc="LeafLabs Maple IDE for Maple boards"
arch=('i686' 'x86_64')
url="http://leaflabs.com/docs/ide.html"
options=(!strip)
license=('Creative Commons Attribution Licence 3.0')
depends=('java-runtime')
if test "$CARCH" == x86_64; then
	depends+=(lib32-libusb-compat)
else
	depends+=(libusb-compat)
fi
source=("http://static.leaflabs.com/pub/leaflabs/maple-ide/maple-ide-0.0.12-linux32.tgz" "maple-ide.png" "maple-ide.desktop" "legacy.conf" "librxtxSerial.so" 
"RXTXcomm.jar")
md5sums=('8230fc1499f2947ad5bda0b14651a4e6' 'b4fa0078a9004604e533f283377ec2dc' '57bfd8cc9350fc9d7427e54ba555ced1' '8465952730ca3e42dd9f2ea30e64da28' 
'6e6d1cd4cd16f6fb7d24a9e15c8e0453' 'efcceaaa78a5dea0b043b6b3cbaf1ef6')

package() {
	cd "$srcdir/maple-ide-v$pkgver"

	mkdir -p "$pkgdir"/usr/{bin,share/{applications,pixmaps}}
	mkdir -p "$pkgdir"/etc/{udev/rules.d/,tmpfiles.d/}

	#Copy files to /usr/share
	cp -r . "$pkgdir/usr/share/maple-ide"
	
	#Install udev rules
	sed -e 's/plugdev/uucp/' -e 's/664/777/' "$pkgdir"/usr/share/maple-ide/tools/45-maple.rules > "$pkgdir"/etc/udev/rules.d/45-maple.rules

	#Create executable in /usr/bin
	echo "#!/bin/sh
cd /usr/share/maple-ide
./maple-ide" > "$pkgdir"/usr/bin/maple-ide
	chmod +x "$pkgdir"/usr/bin/maple-ide

	#Fix GTKLookAndFeel
	sed 's/-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel //' maple-ide > "$pkgdir"/usr/share/maple-ide/maple-ide

	#Fix lock file on Arch
	cp "$srcdir/legacy.conf" "$pkgdir"/etc/tmpfiles.d/

	#Fix for x64
	if test "$CARCH" == x86_64; then
		echo "* Fixing for X64"
		cp "$srcdir/RXTXcomm.jar" "$pkgdir"/usr/share/maple-ide/lib/RXTXcomm.jar
		cp "$srcdir/librxtxSerial.so" "$pkgdir"/usr/share/maple-ide/lib/librxtxSerial.so
	fi

	#Desktop Icon
	install -m644 "$srcdir/maple-ide.desktop" "$pkgdir/usr/share/applications/"
	install -m644 "$srcdir/maple-ide.png" "$pkgdir/usr/share/pixmaps/"

}
