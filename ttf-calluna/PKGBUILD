# Contributor: Jan Misiak <fijam@archlinux.ux>

pkgname=ttf-calluna
pkgver=1
pkgrel=1
pkgdesc="A free opentype font by Jos Buivenga"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.josbuivenga.demon.nl/calluna.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install="calluna.install"
md5sums=('6b59b3cbd7b01d6bdfae45eae87bae43'
         'fc48ba04d7e2a18d598b7a3bbbb58f47')
source=("CallunaRegular.zip"
	"LICENSE")

build() {
    mkdir -p "$pkgdir/usr/share/fonts/OTF"
    install -m 644 -D CallunaRegular/*.otf "$pkgdir/usr/share/fonts/OTF" || return 1
    install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
    }
