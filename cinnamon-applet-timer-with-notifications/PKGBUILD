# Maintainer: ValHue <vhuelamo_at_gmail_dot_com>

pkgname=cinnamon-applet-timer-with-notifications
pkgver=1.0.2
pkgrel=1
pkgdesc="A timer app with visual and auditory notifications."
url="http://cinnamon-spices.linuxmint.com/applets/view/68/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('cinnamon')
optdepends=('sox: Add sox play if you want sound capability.')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/11V4-C04V-VMH4.zip")
md5sums=('b8ba205198c902018338312de53e4667')

package() {
    find timer-notifications\@markbokil.com -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
