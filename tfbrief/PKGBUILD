# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Max Roder <maxroder@web.de>

pkgname='tfbrief'
pkgver='20130916'
pkgrel='1'
pkgdesc='Latex class for writing german DIN-conform letters'
url="http://www.unix-ag.uni-kl.de/~fischer/${pkgname}"
arch=('any')
license=('custom')
install="${pkgname}.install"
noextract=("${pkgname}.cls"
           "lppl.txt")

source=("https://gitorious.org/latex-styles-and-classes/latex-styles-and-classes/raw/eb7859eeca9ec8c7cb533b2805a89c951f19509f:tex/latex/misc/${pkgname}.cls"
        "http://www.latex-project.org/lppl.txt")
md5sums=('9852007b5bbcee6d0eb5e4175cf9b271'
         '9f4337828d782bdea41f03dd2ad1b808')
sha512sums=('414a345b69cd9b0200bc2453a9b84f72d55cb098a5fe9851633c0bde1f9af29baf151cb6b5ac4229b4824b9c3ab946c52cfc99a7bf42ba82d86496d711afaaaf'
            '4c84834dc54cb6e4d88ad9907ab6a541c038a389954679453f372d9481dd45e64733b7189aca34a06e44171f5327d957735677db9ce72d2d2d60136a302680a9')

package() {
	cd "${srcdir}"

	install -Dm644 ${pkgname}.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/${pkgname}/${pkgname}.cls
	install -Dm644 lppl.txt ${pkgdir}/usr/share/licenses/${pkgname}/lppl.txt
}
