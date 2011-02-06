# Contributor: grimi <grimi at poczta dot fm>

pkgname=fluxbox-colorflux-themes
pkgver=1.1
pkgrel=2
pkgdesc="Fluxbox co-style for the Shiki-Colors GTK theme"
arch=('any')
url="http://www.box-look.org/content/show.php/ColorFlux?content=104875"
license=('GPL')
depends=('fluxbox')
makedepends=('sed')
conflicts=('fluxbox-boxcolors-themes')
replaces=('fluxbox-boxcolors-themes')
source=("http://www.saunalahti.fi/~amodinos/andreas/fluxbox/ColorFlux-1.1-w.tar.gz")
md5sums=('18f09cf31be1ae991de81ce031fd8341')

build() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/fluxbox/styles
  for i in Brave Dust Human Illustrious Noble Wine Wise
  do
     sed 's|~/.fluxbox|/usr/share/fluxbox|' -i ColorFlux_${i}/theme.cfg
     cp -r ColorFlux_${i} $pkgdir/usr/share/fluxbox/styles
  done
}



