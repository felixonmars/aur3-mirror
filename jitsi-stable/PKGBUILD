# Maintainer: xduugu
# Contributor: Ananda Samaddar ananda@samaddar.co.uk
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: atommix aka Aleks Lifey <Aleks.Lifey@gmail.com>
# Contributor: Keshav P R <(skodabenz) (aatt) (rocketmail) (ddoott) (ccoomm)>

_pkgname=jitsi
pkgname=$_pkgname-stable
pkgver=2.0.4506.10553
pkgrel=1
pkgdesc="An audio/video/chat communicator that supports protocols such as SIP and XMPP/Jabber"
arch=('i686' 'x86_64')
url="http://jitsi.org"
license=('LGPL')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment')
provides=("$_pkgname=$pkver")
conflicts=("$_pkgname")
options=(!strip !emptydirs zipman !libtool docs)
source=("http://download.jitsi.org/jitsi/src/${_pkgname}-src-${pkgver}.zip"
        $_pkgname.{desktop,sh})
md5sums=('5d79c2c5e71be44fabd9dec45a4c1d52'
         '5923eeca35823f8ef1e416a9a6fc0fac'
         'e7c9507c1b773a5560bd62ff02f81108')
sha256sums=('939adbda52b5aa19592bcd5edf5c77e1bcbbcaa4d0fcdb59c6b5c9e4a10b1e7d'
            '770132b617d94ed468e9592b991ceac10eb3e03e7198b8f5f2f05918f7db4302'
            '476d29d55b66fa1e64aea44a9941d0810c0fc7212ea50000b940073756a1446e')

# uncomment to get the latest stable release; you have to adjust/skip checksums
#source[0]=http://download.jitsi.org/jitsi/src/$(curl -Ss 'http://download.jitsi.org/jitsi/src/' | grep -om1 'jitsi-src[^"<]\+[0-9].zip' | head -1)
#pkgver=$(sed -r 's/[^0-9]*([0-9.]+).*(.build.([0-9]+))\..*/\1.\3/' <<<${source[0]})

build() {
	cd "$srcdir/$_pkgname"

	# append the build revision to the jitsi version
	sed -i "s/0\.build\.by\.SVN/build.${pkgver##*.}/" src/net/java/sip/communicator/impl/version/NightlyBuildID.java

	. /etc/profile.d/apache-ant.sh
	ant rebuild
}

package() {
	cd "$srcdir/$_pkgname"

	find lib/ lib/bundle/ -maxdepth 1 -type f \
		-exec install -Dm644 {} "$pkgdir/usr/lib/$_pkgname/"{} \;
	find lib/os-specific/linux/ -maxdepth 1 -type f \
		-execdir install -Dm644 {} "$pkgdir/usr/lib/$_pkgname/lib/"{} \;

	shopt -sq extglob
	find lib/native/linux$(sed 's/_/-/g' <<<${CARCH/#*(i?86|x86)/})/ -maxdepth 1 -type f \
		-execdir install -Dm644 {} "$pkgdir/usr/lib/$_pkgname/lib/native/"{} \;

	find sc-bundles/{,os-specific/linux/} -maxdepth 1 -type f \
		-execdir install -Dm644 {} "$pkgdir/usr/lib/$_pkgname/sc-bundles/"{} \;

	install -Dm755 "$srcdir/$_pkgname.sh"      "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	local _file
	for _file in resources/install/debian/*.{svg,xpm}; do
		install -Dm644 "$_file" "$pkgdir/usr/share/pixmaps/$_pkgname${_file/*sip-communicator/}"
	done
}
