# Maintainer: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=ttf-thai-latex
pkgver=0.4.17
pkgrel=1
pkgdesc="A collection of Thai scalable and LaTeX fonts available in free licenses"
arch=('any')
url="http://linux.thai.net/taxonomy/term/3"
license=('GPL' 'custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig' 'thailatex>=0.4.6')
makedepends=('fontforge')
provides=('thai-ttf' 'ttf-thai')
conflicts=('ttf-thai')
install=ttf-thai-latex.install
source=(ftp://linux.thai.net/pub/ThaiLinux/software/thaifonts-scalable/thaifonts-scalable-$pkgver.tar.gz
        'LICENSE')
md5sums=('4cdbb081bf0d180ead5e0f04149ff023'
         'cc4f2ce6fbb72abdca36384a7dead27f')

build() {
  cd "$srcdir/thaifonts-scalable-$pkgver"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-ttfdir=/usr/share/fonts/TTF \
    --with-texmfdir=/usr/share/texmf-dist \
    --docdir=/usr/share/doc/thailatex \
    --enable-latex
  make
}

check() {
  cd "$srcdir/thaifonts-scalable-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/thaifonts-scalable-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
