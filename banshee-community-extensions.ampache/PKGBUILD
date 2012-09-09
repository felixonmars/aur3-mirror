# Contributor: Lenzy <lenz94 *AT* gmail *DOT* com>
# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>
pkgname=banshee-community-extensions.ampache
_realname=banshee-community-extensions
pkgver=2.4.0
pkgrel=1
pkgdesc="Banshee Community Extensions is a repository and project for extensions to the Banshee Media Player"
arch=('i686' 'x86_64')
url="http://banshee.fm/"
license=('GPL2')
groups=()
depends=('mono' 'webkit-sharp' 'sqlite3' 'intltool' 'banshee')
makedepends=()
optdepends=()
provides=()
conflicts=('banshee-community-extensions')
replaces=()
backup=()
source=(http://download.banshee-project.org/${_realname}/${pkgver}/${_realname}-${pkgver}.tar.bz2)
sha256sums=('6f20404de80090bb5d88a57c043e876a192f480ac3488ce7697344f1447d48b3')

build() {
        cd "${srcdir}"/${_realname}-$pkgver
        ./configure --prefix=/usr --enable-release --disable-alarmclock --enable-ampache --disable-appindicator --disable-awn --disable-clutterflow --disable-coverwallpaper --disable-jamendo --disable-lastfmfingerprint --disable-lcd --disable-lirc --disable-liveradio --disable-lyrics --disable-magnatune --disable-mirage --disable-openvp --disable-radiostationfetcher --disable-randombylastfm --disable-streamrecorder --disable-karaoke --disable-telepathy --disable-zeitgeistdataprovider
        make
}
package() {
        cd "${srcdir}"/${_realname}-${pkgver}/bin
        mkdir -p "${pkgdir}"/usr/lib/banshee/Extensions
        cp -a * "${pkgdir}"/usr/lib/banshee/Extensions
}

