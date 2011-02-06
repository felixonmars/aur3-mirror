# Contributor : Paul Bragg <paul2lv@gmail.com>
pkgname=mikachanfont
pkgver=8.9
pkgrel=2
pkgdesc="Mikachan Japanese TrueType fonts for X."
url="http://mikachan-font.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://osdn.dl.sourceforge.jp/mikachan/5513/$pkgname-$pkgver.tar.bz2)
md5sums=('8ac2b94336e76fa80996d0be70c557de')

build() {
	cd $startdir/src/$pkgname-$pkgver/fonts/

 # Install fonts
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/

	cd ..

  # Install license
  mkdir -p ${startdir}/pkg/usr/share/licenses/custom/${pkgname}
  install -m644 COPYRIGHT ${startdir}/pkg/usr/share/licenses/custom/${pkgname}/license.txt
}
