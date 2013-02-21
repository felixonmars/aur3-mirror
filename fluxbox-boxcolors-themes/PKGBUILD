# Contributor: grimi <grimi at poczta dot fm>
# Updater: Son Link <sonlink at gmail dot com>

pkgname=fluxbox-boxcolors-themes
pkgver=1.1
pkgrel=2
pkgdesc="Fluxbox adaptation of the Shiki-Colors GTK theme"
arch=('any')
url="http://www.box-look.org/content/show.php/Box-Colors?content=104875"
license=('GPL')
depends=('fluxbox')
source=("https://dl.dropbox.com/u/58286032/aur/colorflux.tar.gz")
md5sums=('c32acbf0d9afce74cf80c5e565dc1f11')

build() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/fluxbox/styles
  for i in Brave Dust Human Illustrious Noble Wine Wise
  do
     sed 's|~/.fluxbox|/usr/share/fluxbox|' -i ColorFlux_${i}/theme.cfg
     cp -r ColorFlux_${i} $pkgdir/usr/share/fluxbox/styles
  done
}

