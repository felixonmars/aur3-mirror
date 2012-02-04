# Contributor: Ander Martínez a.k.a OrE <dwarfnauko@gmail.com>

pkgname=ttf-mplus-ipa
pkgver=1
pkgrel=1
pkgdesc="Goodlooking mixture of the M+ hiragana and IPA fonts for japanese."
arch=('i686' 'x86_64')
url="http://mix-mplus-ipa.sourceforge.jp"
license=('IPA')
depends=('fontconfig' 'xorg-font-utils')

install=ttf.install
source=(mixfont-mplus-ipa-TrueType-20060520p1.tar.bz2::http://globalbase.dl.sourceforge.jp/mix-mplus-ipa/25997/mixfont-mplus-ipa-TrueType-20060520p1.tar.bz2)
md5sums=('ad0c6c19bc6b52d7f98a9b2c93c5cea7')

build() {
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/M+1P+IPAG-circle.ttf \
    $pkgdir/usr/share/fonts/TTF/M+1P+IPAG-circle.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/M+1P+IPAG.ttf \
    $pkgdir/usr/share/fonts/TTF/M+1P+IPAG.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/M+1VM+IPAG-circle.ttf \
    $pkgdir/usr/share/fonts/TTF/M+1VM+IPAG-circle.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/M+2P+IPAG-circle.ttf \
    $pkgdir/usr/share/fonts/TTF/M+2P+IPAG-circle.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/M+2P+IPAG.ttf \
    $pkgdir/usr/share/fonts/TTF/M+2P+IPAG.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/M+2VM+IPAG-circle.ttf \
    $pkgdir/usr/share/fonts/TTF/M+2VM+IPAG-circle.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/ipag.ttf \
    $pkgdir/usr/share/fonts/TTF/ipag.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/ipagp.ttf \
    $pkgdir/usr/share/fonts/TTF/ipagp.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/ipagui.ttf \
    $pkgdir/usr/share/fonts/TTF/ipagui.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/ipam.ttf \
    $pkgdir/usr/share/fonts/TTF/ipam.ttf
install -Dm 644 \
    $srcdir/mixfont-mplus-ipa-TrueType-20060520p1/opfc-ModuleHP-1.1.1_withIPAFonts_and_Mplus/fonts/ipamp.ttf \
    $pkgdir/usr/share/fonts/TTF/ipamp.ttf

}
