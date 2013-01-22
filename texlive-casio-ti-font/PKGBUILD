

# Maintainer: taurgal
pkgname=texlive-casio-ti-font
pkgver=5.3.0
pkgrel=2
pkgdesc="Fonts for casio and TI."
url="http://remi.grolleau.free.fr/public/latex/calculatrices/"
arch=('any')
license=('GPL')
depends=('texlive-core')
install=casio-ti.install
source=(http://remi.grolleau.free.fr/public/latex/calculatrices/Latex-PolicesCalculatrices.tar.gz)
md5sums=('6bb47a10e9c8579dbc3a56912ae9f3bd')

package() {
    fontdir=/usr/share/texmf/fonts
    latexpkgdir=/usr/share/texmf/tex/latex

    #Creating directories for fonts
    install -d $pkgdir/$fontdir/afm/ti/
    install -d $pkgdir/$fontdir/tfm/ti/
    install -d $pkgdir/$fontdir/type1/ti/
    install -d $pkgdir/$fontdir/enc/ti/
    install -d $pkgdir/$fontdir/afm/casio/
    install -d $pkgdir/$fontdir/tfm/casio/
    install -d $pkgdir/$fontdir/type1/casio/
    install -d $pkgdir/$fontdir/enc/casio/
    install -d $pkgdir/$fontdir/map/dvips/updmap/
    install -d $pkgdir/$fontdir/map/dvips/updmap/

    cp $srcdir/ti82statsfr/ti82statsfr.afm $pkgdir/$fontdir/afm/ti/
    cp $srcdir/ti82statsfr/ti82statsfr.tfm $pkgdir/$fontdir/tfm/ti/
    cp $srcdir/ti82statsfr/ti82statsfr.pfb $pkgdir/$fontdir/type1/ti/
    cp $srcdir/ti82statsfr/ti82statsfr.enc $pkgdir/$fontdir/enc/ti/
    cp $srcdir/ti82statsfr/ti.map          $pkgdir/$fontdir/map/dvips/updmap/ti.map
    cp $srcdir/casiograph/casiograph.afm   $pkgdir/$fontdir/afm/casio/
    cp $srcdir/casiograph/casiograph.tfm   $pkgdir/$fontdir/tfm/casio/
    cp $srcdir/casiograph/casiograph.pfb   $pkgdir/$fontdir/type1/casio/
    cp $srcdir/casiograph/casiograph.enc   $pkgdir/$fontdir/enc/casio/
    cp $srcdir/casiograph/casio.map        $pkgdir/$fontdir/map/dvips/updmap/casio.map

    install -d $pkgdir/$latexpkgdir/ti82statsfr/
    install -d $pkgdir/$latexpkgdir/casiograph/

    #Installation des fonts
    cp $srcdir/ti82statsfr/ti82statsfrfont.sty $pkgdir/$latexpkgdir/ti82statsfr/
    cp $srcdir/ti82statsfr/uti82statsfr.fd     $pkgdir/$latexpkgdir/ti82statsfr/
    cp $srcdir/casiograph/casiographfont.sty   $pkgdir/$latexpkgdir/casiograph/
    cp $srcdir/casiograph/ucasiograph.fd       $pkgdir/$latexpkgdir/casiograph/
}
