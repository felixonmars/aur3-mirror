pkgname=nwn-dedicated-server
pkgver=1.69
pkgrel=2
pkgdesc="Neverwinter Nights dedicated server."
arch=('i686' 'x86_64')
url="http://nwn.bioware.com/downloads/standaloneserver.html"
license=('unknown')
source=(http://files.bioware.com/neverwinternights/updates/windows/server/NWNDedicatedServer$pkgver.zip)
noextract=(NWNDedicatedServer$pkgver.zip)
depends=(glibc)
if test "$CARCH" == x86_64; then
  depends=(lib32-glibc)
fi
makedepends=('unzip')
md5sums=('4c62f62d9511ff6a8e7b25437d90ff04')

build() {
	install -d $srcdir/$pkgname-$pkgver
	cd $srcdir/$pkgname-$pkgver
	echo "Extracting source zip"
	unzip -qo ../NWNDedicatedServer$pkgver.zip

	#Extract linux server scripts
	tar xf linuxdedserver*.tar.gz
	chmod +x nwserver fixinstall

	#Copy all files
	install -d $pkgdir/opt/nwn-dedicated-server
	install -d $pkgdir/usr/bin
	echo -e '#!/bin/sh\ncd /opt/nwn-dedicated-server\n./nwserver' > $pkgdir/usr/bin/nwserver
	chmod +x $pkgdir/usr/bin/nwserver
	mv * $pkgdir/opt/nwn-dedicated-server
}
