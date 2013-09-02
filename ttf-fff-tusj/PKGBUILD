# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ttf-fff-tusj
pkgver=1
pkgrel=2
pkgdesc="A handwritten font done with India ink and based on Georgia Bold"
arch=(i686 x86_64)
url=http://www.formfett.net
license=(freeware)
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=(http://www.formfett.net/wp-content/download/FFFTusj.zip)
sha256sums=('97bdbc7bed745e49bdce729eba2919058832817ad2d5a347973043df8804bf2f')
sha512sums=('63eeb46aba4bde54bc6ef9328201a168fef256d2d721d93d36eeaea8be96ad0efdbf9ccd4e7500b6ffa7cabaa05da179d52eb10e3ee24865a65f8512c2903b4f')

package() {
    install -Dm644 "FFF Tusj.ttf" "$pkgdir"/usr/share/fonts/TTF/fff_tusj.ttf
}
