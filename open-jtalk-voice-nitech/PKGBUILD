# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=open-jtalk-voice-nitech
pkgver=1.05
_pkgname=hts_voice_nitech_jp_atr503_m001
pkgrel=1
pkgdesc="HTS voice for Open JTalk trained with the Nitech Japanese Speech Database."
arch=('any')
url="http://open-jtalk.sourceforge.net/"
license=('CCPL:cc-by-3.0')
source=("http://downloads.sourceforge.net/open-jtalk/$_pkgname-$pkgver.tar.gz")
md5sums=('c92b7fe7229e95c4601c22be9b90ce5e')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    voicefile=nitech_jp_atr503_m001.htsvoice
    install -D -m644 $voicefile "${pkgdir}/usr/share/open-jtalk/$voicefile"
}
