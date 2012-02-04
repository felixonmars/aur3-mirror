pkgname=tud-corporate-design
pkgver=04052011
pkgrel=1
pkgdesc="Corporate design templates of the Dresden University Of Technology"
arch=('i686' 'x86_64')
license=('costum')
url="http://www.tu-dresden.de"
depends=('texlive-core' 'texlive-bin' 'unzip')
source=('http://tu-dresden.de/service/cd/4_latex/dat/update_110504/tud_vorlagen_20110504.zip')
noextract=('tud_vorlagen_20110504.zip')
md5sums=('6131e21a9e5678da8e1bd956242553b5')
install="tud-vorlagen.install"
build(){
	cd $srcdir
	mkdir -p $srcdir/usr/share/texmf/tex/latex/tud
	unzip tud_vorlagen_20110504.zip -d $srcdir/usr/share/texmf/tex/latex/tud 
	rm tud_vorlagen_20110504.zip
}
package() {
  cd $srcdir
  mv * $pkgdir
}
