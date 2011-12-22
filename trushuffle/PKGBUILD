# Maintainer: Gadget3000 <gadget3000 at msn dot com>
pkgname=trushuffle
pkgver=1.5
pkgrel=2
pkgdesc="An automatic Spotify playlist generator for your last.fm recommendations"
arch=('i686' 'x86_64')
url="http://www.trushuffle.com"
license=('Unknown')
depends=('qt' 'qtwebkit')

changelog=
if [ "${CARCH}" = "x86_64" ]; then
	md5sums=('278e5f1b398e6d115f4a780bf52bb7e5')
	_carch=amd64
else
	md5sums=('bf9a187daf7264c7adb9a93e873408bd')
	 _carch=i386
fi
source=(http://www.trushuffle.com/assets/client/trushuffle_${pkgver}_${_carch}.deb)

noextract=()

build() {
  cd $srcdir
  ar x trushuffle_${pkgver}_${_carch}.deb > /dev/null || return 1
  tar -xzf data.tar.gz -C $pkgdir || return 1

}

package() {
  mv $pkgdir/bin $pkgdir/usr/
}
