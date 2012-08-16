# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=zipwhip
pkgver=1.3.3
pkgrel=1
pkgdesc="Text anyone from your computer using your existing mobile number."
arch=('i686' 'x86_64')
url="http://zipwhip.net"
license=('custom')
install=$pkgname.install

if [ "$CARCH" = "i686" ]; then
	_arch='i586'
	sha256sums=('44397fd0c6a24ee1f6fb83a2a6ec24ec43a847405e272c13588c783eedbd8d7a')
	source=("http://zipwhip.cachefly.net/${pkgname}-desktop-${_arch}.deb")
elif [ "$CARCH" = "x86_64" ]; then
	_arch='amd64'
	sha256sums=('460fb295cab2b5ca4a7e23790355dba89ea313252cc7798bc9a29272655c1251')
	source=("http://zipwhip.cachefly.net/${pkgname}-desktop-${_arch}.deb")
fi

build() {
	cd "$srcdir"
	ar vx $pkgname-desktop-$_arch.deb
	tar zxf data.tar.gz -C "$pkgdir"/
}

package() {
	# Note that the below is the postinstall script from the pkg not my own work

	APP_INSTALL_DIR="$pkgdir/usr/share/zipwhip"
	cd $APP_INSTALL_DIR
	sh jre-6u33-linux.bin
	mv $APP_INSTALL_DIR/jre1.6.0_33 $APP_INSTALL_DIR/java_vm
	mv $APP_INSTALL_DIR/java_vm/bin/java $APP_INSTALL_DIR/java_vm/bin/zipwhip
	mv $APP_INSTALL_DIR/java_vm/bin/javaws $APP_INSTALL_DIR/java_vm/bin/zipwhipw

	# Clean up install directory
	rm -f $APP_INSTALL_DIR/jre-6u33-linux.bin
}
