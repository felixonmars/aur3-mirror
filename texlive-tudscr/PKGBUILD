# Maintainer: Kevin Mäder <kmaeder[AT]kevin-maeder[dot]de>
# TU Dresden corporate design classes tudscr by Falk Hanisch

pkgname=texlive-tudscr
pkgver=2.03
pkgrel=1
pkgdesc="TeX Live - TU Dresden corporate design classes tudscr by Falk Hanisch"
license=('LPPL')
arch=('any')
depends=('texlive-core' 'texlive-tudscr-fonts')
url=("http://wwwpub.zih.tu-dresden.de/~fahan/tudscr/")
install=texlive.install
source=("https://github.com/tud-cd/tudscr/releases/download/v${pkgver}/tudscr_v${pkgver}.zip")
md5sums=('ac2072858f4eb0f07c1b859d1b15c2d1')
TEXPATH=/usr/share/texmf/

package() {
    bsdtar -xf tudscr_v${pkgver}.zip -C $srcdir
	cd $srcdir
	mkdir -p $pkgdir$TEXPATH
	cp -r doc $pkgdir$TEXPATH
	cp -r tex $pkgdir$TEXPATH

    install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs/
    touch $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${pkgver}-${pkgrel}.pkgs
    chmod 644 $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${pkgver}-${pkgrel}.pkgs
}
