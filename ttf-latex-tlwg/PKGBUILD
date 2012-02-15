# Maintainer: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=ttf-latex-tlwg
pkgver=0.5.0
pkgrel=1
pkgdesc="A collection of Thai scalable and LaTeX fonts available in free licenses"
arch=('any')
url="http://linux.thai.net/projects/fonts-tlwg"
license=('GPL' 'custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 
         'fontconfig' 'texlive-bin')
makedepends=('fontforge')
provides=('thai-ttf' 'ttf-thai')
conflicts=('ttf-thai' 'ttf-thai-latex')
install=ttf-latex-tlwg.install
source=(ftp://linux.thai.net/pub/ThaiLinux/software/fonts-tlwg/fonts-tlwg-$pkgver.tar.gz
        'LICENSE')
md5sums=('e407df4a9652aa1555e3dd5894d6ddd8'
         'cc4f2ce6fbb72abdca36384a7dead27f')

build() {
  cd "$srcdir/fonts-tlwg-$pkgver"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-ttfdir=/usr/share/fonts/TTF \
    --with-texmfdir=/usr/share/texmf-dist \
    --docdir=/usr/share/doc/thailatex \
    --enable-latex
  make
}

check() {
  cd "$srcdir/fonts-tlwg-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/fonts-tlwg-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
