
# Contributor: Gereon Schomber
# Original PKGBUILD by grimi <grimi@poczta.fm>

pkgname=urbanterror-server
pkgver=4.1
pkgrel=3
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (server only)"
arch=('i686' 'x86_64')
url="http://www.urbanterror.net"
license=('GPL2')
depends=('urbanterror-data')
conflicts=('urbanterror')
makedepends=('unzip')
source=("http://daffy.nerius.com/src/ioUrbanTerrorSource_2007_12_20-patchedserver_2.zip" \
	"urbanterror-server.sh")

build() {

	## checkup machine
        [ "$CARCH" = "i686"   ] && ARCH=i386
        [ "$CARCH" = "x86_64" ] && ARCH=x86_64

	## prepare folder
	install -d $pkgdir/opt/urbanterror/

	## compile server
	cd $srcdir/ioUrbanTerrorServerSource
	make || return 1
	install -m755 build/release-linux-$ARCH/ioUrTded.$ARCH \
		$pkgdir/opt/urbanterror/ioUrTded

	## launch scripts
	install -Dm755 $srcdir/urbanterror-server.sh $pkgdir/usr/bin/urbanterror-server
}

md5sums=('46a6fdb103b40b09864e24e15b96aa99'
         'effe9b87616358840c44ad7c37b5538f')
