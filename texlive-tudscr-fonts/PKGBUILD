# Maintainer: Kevin Mäder <kmaeder[AT]kevin-maeder[dot]de>
# TU Dresden corporate design font install

# copy DIN_Bd_PS.zip and Univers_ps.zip to directory with PKGBUILD!!!

pkgname=texlive-tudscr-fonts
pkgver=2.02
pkgrel=1
pkgdesc="TeX Live - TU Dresden corporate design fonts for tudscr"
license=('custom:tud-cd-fonts')
arch=('any')
depends=('texlive-core' 'texlive-fontsextra')
url=("http://latex.wcms-file3.tu-dresden.de/phpBB3/index.php")
install=texlive.install
source=("DIN_Bd_PS.zip" "Univers_ps.zip" "https://github.com/tud-cd/tudscr/releases/download/fonts/TUD-KOMA-Script_fonts_Unix.zip" "texlive-tudscr-fonts.maps" "LICENSE")
md5sums=('53d4b9ca49a0966132d818b44fcc8ef4' '9a8dbc15591bb7b5e53d3871746efb53' 'df68bc8bcb2105fadce01b07a3a90699' '5d7289d1280ea193c1bd76a188f28a17' '6cfb9405ed5429fb03883fad19153fdc')

# if you change the path here make sure to change it in texlive.install too
TEXPATH=/usr/share/texmf

build() {
    bsdtar -xf TUD-KOMA-Script_fonts_Unix.zip -C $srcdir tudscrfonts.zip
    bsdtar -xf $srcdir/tudscrfonts.zip

	cd $srcdir
	echo ">>> rename font files"
    mv -f DINBd___.pfb 0m6b8a.pfb
    mv -f DINBd___.afm 0m6b8a.afm
    mv -f uvceb___.pfb lunb8a.pfb
    mv -f uvceb___.afm lunb8a.afm
    mv -f uvcel___.pfb lunl8a.pfb
    mv -f uvcel___.afm lunl8a.afm
    mv -f uvceo___.pfb lunro8a.pfb
    mv -f uvceo___.afm lunro8a.afm
    mv -f uvxbo___.pfb lunbo8a.pfb
    mv -f uvxbo___.afm lunbo8a.afm
    mv -f uvxlo___.pfb lunlo8a.pfb
    mv -f uvxlo___.afm lunlo8a.afm
    mv -f uvce____.pfb lunr8a.pfb
    mv -f uvce____.afm lunr8a.afm
    mv -f uvczo___.pfb lunco8a.pfb
    mv -f uvczo___.afm lunco8a.afm
    mv -f uvcz____.pfb lunc8a.pfb
    mv -f uvcz____.afm lunc8a.afm

    echo ">>> create virtual fonts"
    tftopl cmbr10.tfm cmbr10.pl
    tftopl cmbrsl10.tfm cmbrsl10.pl
    tftopl cmbrbx10.tfm cmbrbx10.pl
    tftopl tbmr10.tfm tbmr10.pl
    tftopl tbmo10.tfm tbmo10.pl
    tftopl tbsr10.tfm tbsr10.pl
    tftopl tbso10.tfm tbso10.pl
    tftopl tbbx10.tfm tbbx10.pl
    tftopl cmbrmi10.tfm cmbrmi10.pl
    tftopl cmbrmb10.tfm cmbrmb10.pl
    tftopl cmbrsy10.tfm cmbrsy10.pl
    tftopl sy-iwonamz.tfm sy-iwonamz.pl
    tftopl sy-iwonahz.tfm sy-iwonahz.pl
    tftopl rm-iwonach.tfm rm-iwonach.pl
    tftopl rm-iwonachi.tfm rm-iwonachi.pl
    tftopl ts1-iwonach.tfm ts1-iwonach.pl
    tftopl ts1-iwonachi.tfm ts1-iwonachi.pl
    tftopl mi-iwonachi.tfm mi-iwonachi.pl
    tftopl sy-iwonachz.tfm sy-iwonachz.pl
    latex installfonts.tex

# now we have files of type .afm .fd, .mtx, .pfb, .pl, .vpl
    echo ">>> convert font and metric files to machine readable format"
    for f in *.pl ; do
        pltotf $f
    done

    for f in *.vpl ; do
        vptovf $f
    done

echo ">>> create map files"
    latex createmap.tex
}

package() {
	install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
	install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
    touch $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${pkgver}-${pkgrel}.pkgs
    chmod 644 $pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${pkgver}-${pkgrel}.pkgs

	install -m755 -d $pkgdir$TEXPATH/tex/latex/tudscr-fonts
	install -m755 -d $pkgdir$TEXPATH/fonts/tfm/adobe/tudscr-fonts
	install -m755 -d $pkgdir$TEXPATH/fonts/afm/adobe/tudscr-fonts
	install -m755 -d $pkgdir$TEXPATH/fonts/vf/adobe/tudscr-fonts
	install -m755 -d $pkgdir$TEXPATH/fonts/type1/adobe/tudscr-fonts
	install -m755 -d $pkgdir$TEXPATH/fonts/map

	install -m644 *.fd  $pkgdir$TEXPATH/tex/latex/tudscr-fonts/
	install -m644 *.tfm $pkgdir$TEXPATH/fonts/tfm/adobe/tudscr-fonts/
	install -m644 *.afm $pkgdir$TEXPATH/fonts/afm/adobe/tudscr-fonts/
	install -m644 *.vf  $pkgdir$TEXPATH/fonts/vf/adobe/tudscr-fonts/
	install -m644 *.pfb $pkgdir$TEXPATH/fonts/type1/adobe/tudscr-fonts/
	install -m644 tudscr.map $pkgdir$TEXPATH/fonts/map

	install -D -m 644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE:tud-cd-fonts"
}
