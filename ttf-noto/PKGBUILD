# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=ttf-noto
pkgver=20140716
pkgrel=1
pkgdesc="Fonts support all languages/characters in Unicode"
arch=('any')
url="http://www.google.com/get/noto"
license=('apache')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=()
conflicts=()
provides=('ttf-font')
source=("http://www.google.com/get/noto/pkgs/Noto-hinted.zip")
md5sums=('e72d000d9e90729a6caceff7afaf1f45')
install=$pkgname.install

package() {
    mkdir -p $pkgdir/usr/share/fonts/{TTF,OTF}
    cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
    cp $srcdir/*.otf $pkgdir/usr/share/fonts/OTF
	chmod 644 $pkgdir/usr/share/fonts/{TTF,OTF}/*
}

