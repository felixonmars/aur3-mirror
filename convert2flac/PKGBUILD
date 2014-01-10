# Maintainer and contributor: m0rph < m0rph.mailbox (at) gmail.com >

pkgname=convert2flac
pkgver=1.14
pkgrel=2
pkgdesc="ALAC/APE to FLAC converter script"
arch=(any)
depends=('ffmpeg' 'flac' 'mplayer')
license=('GPLv3')
url=('http://localhost')
source=(convert2flac)
md5sums=('55bff67780f61b7ed482297256b21ab5')

build() {
    install -Dm755 ${startdir}/convert2flac ${pkgdir}/usr/bin/convert2flac
}

