# submitter: perlawk
# Maintainer: perlawk

pkgname=tkslide
pkgver=0.22
pkgrel=1
pkgdesc="TkS*LIDE = Snobol/Spitbol (S*L) Integrated Development Environment (IDE) in TCL/Tk (Tk)."
url="http://rms.republika.pl/slide.shtml"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('tcl' 'tk' 'csnobol4')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=tkslide.install
source=( 'http://rms.republika.pl/slide/tkslide.tar.gz'
'slide' 'snotty')

prepare() {
	cd $srcdir
	if [ ! -e tkslide ]; then
		git clone https://github.com/tkslide/tkslide.git
	fi
}

build() {
  cd "${srcdir}/${pkgname}"
}
 
package() {
  cd "${srcdir}/${pkgname}"
	mkdir -p "$pkgdir"/usr/share/tkslide
	cp -a tkslide* $startdir/slide $startdir/snotty snotty.tcl prefix.sno doc example lib res \
	"$pkgdir"/usr/share/tkslide
}
md5sums=('e26c666f988ffd9597c26a479ce217e2'
         'ddf0a080191e8d003d70cbdc534e2235'
         'c3efd74179cea666260199da6c66265d')
