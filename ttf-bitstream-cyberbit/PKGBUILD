# Contributor: Kosenko Roman <madkite@gmail.com>
# Maintainer: listx <linusarver <at> gmail <dot> com>
pkgname=ttf-bitstream-cyberbit
pkgver=2.0
pkgrel=5
pkgdesc='Bitstream Cyberbit Unicode Font'
arch=('any')
license=('custom')
url='http://www.bitstream.com/fonts'
depends=('fontconfig' 'xorg-font-utils')
install='install'
source=(
	'http://ftp.netscape.com/pub/communicator/extras/fonts/windows/Cyberbit.ZIP'
	'http://ftp.netscape.com/pub/communicator/extras/fonts/windows/(c)bits98.txt'
)
sha1sums=('ad75fc3c634f6d39ba1f9fe400895a7132e31d1b'
          'eef0d0b8e4ef8b7a10417a18277b56ed96187ddb')

package() {
	install -d $pkgdir/usr/share/fonts/TTF
	install -d $pkgdir/usr/share/licenses/$pkgname
	install -m644 Cyberbit.ttf $pkgdir/usr/share/fonts/TTF/
	install -m644 '(c)bits98.txt' $pkgdir/usr/share/licenses/$pkgname/
}
