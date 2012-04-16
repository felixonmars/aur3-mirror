# Maintainer: Milan <r-whizz@seznam.cz>

pkgname=ttf-lido-stf
pkgver=0
pkgrel=1
pkgdesc="Lido STF TrueType"
arch=('any')
url="http://cooltext.com/Download-Font-Lido+STF"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=("lido.zip::http://cooltext.com/Download-Request?Type=Font&ID=1270")
md5sums=('bd5c21658453e61c4c643dd037b4a874')
install=$pkgname.install

build() {
    install -Dm 644 "$srcdir/Lido_Free/OpenType/LidoSTF.otf" "$pkgdir/usr/share/fonts/OTF/LidoSTF.otf"
    install -Dm 644 "$srcdir/Lido_Free/OpenType/LidoSTFBold.otf" "$pkgdir/usr/share/fonts/OTF/LidoSTFBold.otf"
    install -Dm 644 "$srcdir/Lido_Free/OpenType/LidoSTFBoldItalic.otf" "$pkgdir/usr/share/fonts/OTF/LidoSTFBoldItalic.otf"
    install -Dm 644 "$srcdir/Lido_Free/OpenType/LidoSTFCond.otf" "$pkgdir/usr/share/fonts/OTF/LidoSTFCond.otf"
    install -Dm 644 "$srcdir/Lido_Free/OpenType/LidoSTFCondBold.otf" "$pkgdir/usr/share/fonts/OTF/LidoSTFCondBold.otf"
    install -Dm 644 "$srcdir/Lido_Free/OpenType/LidoSTFItalic.otf" "$pkgdir/usr/share/fonts/OTF/LidoSTFItalic.otf"

    install -Dm 644 "$srcdir/Lido_Free/TrueType/LidoSTF.ttf" "$pkgdir/usr/share/fonts/TTF/LidoSTF.ttf"
    install -Dm 644 "$srcdir/Lido_Free/TrueType/LidoSTFBold.ttf" "$pkgdir/usr/share/fonts/TTF/LidoSTFBold.ttf"
    install -Dm 644 "$srcdir/Lido_Free/TrueType/LidoSTFBoldItalic.ttf" "$pkgdir/usr/share/fonts/TTF/LidoSTFBoldItalic.ttf"
    install -Dm 644 "$srcdir/Lido_Free/TrueType/LidoSTFCond.ttf" "$pkgdir/usr/share/fonts/TTF/LidoSTFCond.ttf"
    install -Dm 644 "$srcdir/Lido_Free/TrueType/LidoSTFCondBold.ttf" "$pkgdir/usr/share/fonts/TTF/LidoSTFCondBold.ttf"
    install -Dm 644 "$srcdir/Lido_Free/TrueType/LidoSTFItalic.ttf" "$pkgdir/usr/share/fonts/TTF/LidoSTFItalic.ttf"
}
