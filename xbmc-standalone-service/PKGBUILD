# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=xbmc-standalone-service
pkgver=1.3
pkgrel=1
pkgdesc="Systemd service and user to autostart xbmc at boot"
arch=('any')
url="https://wiki.archlinux.org/index.php/Xbmc#Autostarting_at_boot"
license=('GPL')
depends=('xbmc>=13.1-5' 'systemd' 'xorg-server' 'xorg-xinit')
install=readme.install
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dce087ad4ffec928ddbe23c5dc4a16c79a57f92abec5974aa3d6b1b5b21d55cc')

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/init/xbmc.service" "$pkgdir/usr/lib/systemd/system/xbmc.service"
	install -Dm755 "$srcdir/$pkgname-$pkgver/common/xbmc-standalone2" "$pkgdir/usr/bin/xbmc-standalone2"

	install -dm 700 "$pkgdir"/var/lib/xbmc
	chown 420:420 "$pkgdir"/var/lib/xbmc
}
