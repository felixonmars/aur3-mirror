# Maintainer: Kevin Mäder <kmaeder[AT]kevin-maeder[dot]de>
# TU Dresden Corporate Design Vorlagen von Klaus Bergmann

pkgname=texlive-tud-cd-vorlagen
pkgver=20120805
pkgrel=1
pkgdesc="TeX Live - TU Dresden Corporate Design Vorlagen von Klaus Bergmann"
license=('unknown')
arch=('any')
depends=('texlive-core' 'texlive-tud-cd-fonts')
url=("http://latex.wcms-file3.tu-dresden.de/phpBB3/index.php")
install=texlive.install
source=("http://tu-dresden.de/service/publizieren/cd/4_latex/dat/Vorlagen_${pkgver}.zip")
md5sums=('4dda2e81b742e59fdcfa94786fe6b97e')

TEXPATH=/usr/share/texmf/

package() {
	mkdir -p $pkgdir${TEXPATH}tex/latex/tud-cd-vorlagen
	cd $srcdir
	bsdtar -xf vorlagen_${pkgver}.zip -C $pkgdir${TEXPATH}tex/latex/tud-cd-vorlagen
	chmod 755 -R $pkgdir${TEXPATH}tex/latex/tud-cd-vorlagen

    install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs/
    touch $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${pkgver}-${pkgrel}.pkgs
    chmod 644 $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${pkgver}-${pkgrel}.pkgs
}
