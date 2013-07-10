# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Roberto Alsina <ralsina@netmanagers.com.ar>

pkgname=ttf-selfism
pkgver=1
pkgrel=1
pkgdesc="A decorative LED font"
arch=('i686' 'x86_64')
url="http://www.sonntag.nl/seiten/free/selfism/selfism.htm"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')

install=ttf.install
source=(http://www.sonntag.nl/seiten/free/selfism/selfism.zip)

package() {
    cd $startdir/src
    install -D Selfism_License.txt $startdir/pkg/usr/share/licenses/ttf-selfism/COPYING
    install -Dm 644 Selfism\ Bold.otf $pkgdir/usr/share/fonts/TTF/selfism_bold.otf
    install -Dm 644 Selfism\ Normal.otf $pkgdir/usr/share/fonts/TTF/selfism_normal.otf
}
md5sums=('159fc8994eea0f31d39e0bfa8c8b1012')
