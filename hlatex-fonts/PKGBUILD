# Contributor: Will Tipton <wtipton@hmc.edu>
pkgname=hlatex-fonts
_pkgname=HLaTeX
pkgver=1.0
pkgrel="1" 
pkgdesc="Provides fonts for HLaTeX."
install=hlatex-fonts.install
depends=()
source=(ftp://ftp.dante.de/tex-archive/fonts/korean/$_pkgname.zip)
url="http://project.ktug.or.kr/hlatex/"
md5sums=('ea453d5c51a09c0e9257d3d10d6366e3')

build() {
	TEXMF=$startdir/pkg/usr/share/texmf

	mkdir -p $TEXMF/fonts
	cd $TEXMF/fonts

	for i in `ls -1 $startdir/src/$_pkgname | grep -v uhc-fonts`
	do
		echo "Extracting $i.."
		tar xzf $startdir/src/$_pkgname/$i
	done

	cd $startdir/src/$_pkgname/
	mkdir -p $TEXMF/fonts/map/hlatex
	tar xzf uhc-fonts.tar.gz
	cp uhc-fonts-$pkgver/{uhc-base.map,uhc-extra.map} $TEXMF/fonts/map/hlatex/
}
