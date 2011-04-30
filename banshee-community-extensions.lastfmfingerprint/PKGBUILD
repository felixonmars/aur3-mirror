# Maintainer: Sebastian Lenz <sebastian@archusers.de>
pkgname=banshee-community-extensions.lastfmfingerprint
_realname=banshee-community-extensions
pkgver=2.0.0
pkgrel=1
pkgdesc="Banshee Community Extensions is a repository and project for extensions to the Banshee Media Player"
arch=('i686' 'x86_64')
url="http://banshee.fm/"
license=('GPL2')
groups=()
depends=('mono' 'webkit-sharp' 'sqlite3' 'intltool' 'banshee' 'fftw')
makedepends=()
optdepends=()
provides=()
conflicts=('banshee-community-extensions')
replaces=()
backup=()
source=(http://download.banshee-project.org/${_realname}/${pkgver}/${_realname}-${pkgver}.tar.gz)
sha256sums=('20fe5dcb5f244f3a19552931cc7949198507490f161fd56906bcfedbbc9f3652')

build() {
        cd "${srcdir}"/${_realname}-$pkgver
        ./configure --prefix=/usr --enable-release --disable-alarmclock --disable-ampache --disable-appindicator --disable-awn --disable-clutterflow --disable-coverwallpaper --disable-jamendo --enable-lastfmfingerprint --disable-lcd --disable-lirc --disable-liveradio --disable-lyrics --disable-magnatune --disable-mirage --disable-openvp --disable-radiostationfetcher --disable-randombylastfm --disable-streamrecorder --disable-karaoke --disable-telepathy --disable-zeitgeistdataprovider
        make
}
package() {
        cd "${srcdir}"/${_realname}-${pkgver}/bin
        mkdir -p "${pkgdir}"/usr/lib/banshee/Extensions
        cp -a * "${pkgdir}"/usr/lib/banshee/Extensions
}

