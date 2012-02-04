# Contributor: Leonardo Damian Barberon <damian01w@gmail.com>

pkgname=wolframalpha-konqueror-search
pkgver=0.1
pkgrel=2
pkgdesc="Konqueror search engine for Wolfram|Alpha."
arch=(i686 x86_64)
url="http://www.wolframalpha.com/"
license=('GPL')
depends=('konq-plugins')
source=('wolframalpha.desktop')
md5sums=('6b997d92e815200912892b72421aab3d')

build() {
    mkdir -p ${pkgdir}/usr/share/kde4/services/searchproviders
    install -m 644 ${srcdir}/*.desktop ${pkgdir}/usr/share/kde4/services/searchproviders
}

