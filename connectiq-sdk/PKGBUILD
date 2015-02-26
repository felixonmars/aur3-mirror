# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=connectiq-sdk
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="The Connect IQ SDK contains a quick start guide, sample projects, a device simulator and all the documentation and resources you need to get started."
arch=('x86_64')
url=("http://developer.garmin.com/connect-iq/" 'http://blog.aaronboman.com/programming/connectiq/2014/11/13/the-garmin-connect-iq-sdk-on-ubuntu-linux/')
license=('custom:Garmin CONNECT IQ SDK License Agreement')
groups=()
depends=('wine' 'java-environment')
makedepends=('unzip' 'wget' 'dos2unix')
checkdepends=('lib32-mpg123')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://developer.garmin.com/downloads/connect-iq/sdks/$pkgname-win-$pkgver.zip"
        "https://raw.githubusercontent.com/julian-r/garmin-iq-sdk-PKGBUILD/master/monkeydo.patch"
        "https://raw.githubusercontent.com/julian-r/garmin-iq-sdk-PKGBUILD/master/connectiq.patch")

noextract=("$pkgname-win-$pkgver.zip")
validpgpkeys=()

prepare() {
	mkdir "$pkgname-$pkgver"
        unzip "$pkgname-win-$pkgver.zip" -d "$pkgname-$pkgver"
        ##patch mokeydo
        cd "$pkgname-$pkgver"
        patch -p2 -i "$srcdir/monkeydo.patch"
        patch -p2 -i "$srcdir/connectiq.patch"

}

build() {
	cd "$pkgname-$pkgver"
        dos2unix "bin/monkeydo"
        dos2unix "bin/connectiq"
        dos2unix "bin/monkeyc"

        chmod +x "bin/monkeydo"
        chmod +x "bin/monkeyc"
        chmod +x "bin/connectiq"

}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
        ##install licence file
        mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
        wget "http://developer.garmin.com/connect-iq/sdk/" -O \
            "$pkgdir/usr/share/licenses/$pkgname/licence.html"
        mkdir -p "$pkgdir/opt/$pkgname"
	cp -a * "$pkgdir/opt/$pkgname"
        
        mkdir -p $pkgdir/etc/profile.d/
        echo 'export PATH="$PATH":'"/opt/$pkgname/bin" > "$pkgdir/etc/profile.d/$pkgname"
        echo "export MB_HOME=/opt/$pkgname/bin" >> "$pkgdir/etc/profile.d/$pkgname"
        chmod +x "$pkgdir/etc/profile.d/$pkgname"
}
sha256sums=('aa6eeb9312d5ece5bbb325926b5f43d166b4391320f09529761389a9059eac72'
            '02b415cc8b13a143e8156405ef72c0869f8de2aaf5c8937a79765ea10829af07'
            '19504c936dd3ea4af171974112fc2bb8b71528c7757c7f07da0cfa8e560bfd32')

