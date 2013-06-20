# Contributor: Jimmy Ricco van Turnhout <j.r.v.turnhout@student.tue.nl>

pkgname=tue-beamer-styles
pkgver=1
pkgrel=1
pkgdesc="LaTeX beamer styles used at Eindhoven University of Technology (2008 version)"
arch=('any')
url="http://pkgs.jrvturnhout.nl/tue-beamer-styles/"
license=('unknown')
depends=('texlive-core')
install='tue-beamer-styles.install'
source=("http://pkgs.jrvturnhout.nl/tue-beamer-styles/beamercolorthemetue2008plain.sty"
        "http://pkgs.jrvturnhout.nl/tue-beamer-styles/beamerfontthemetue2008plain.sty"
        "http://pkgs.jrvturnhout.nl/tue-beamer-styles/beamerouterthemetue2008plain.sty"
        "http://pkgs.jrvturnhout.nl/tue-beamer-styles/beamerthemetue2008.sty"
        "http://pkgs.jrvturnhout.nl/tue-beamer-styles/tuestyle.sty"
        "http://pkgs.jrvturnhout.nl/tue-beamer-styles/tuelogo.eps"
        "http://pkgs.jrvturnhout.nl/tue-beamer-styles/tuelogo.pdf")

build()
{
        mkdir -p $pkgdir/usr/share/texmf/tex/latex/tue-beamer-styles
        mkdir -p $pkgdir/usr/share/texmf/tex/latex/tue-beamer-styles/logos
        cd "${srcdir}"
        cp tuelogo.eps $pkgdir/usr/share/texmf/tex/latex/tue-beamer-styles/logos
        cp tuelogo.pdf $pkgdir/usr/share/texmf/tex/latex/tue-beamer-styles/logos
        
    for i in *.sty; do
        local destname="$(echo "$i" | sed 's|-[[:digit:].]\{1,\}\.sty$|.sty|')"
        cp $i $pkgdir/usr/share/texmf/tex/latex/tue-beamer-styles
    done
} 

md5sums=('2be316c7327cf50a5013e5daff398334'
         'af80e0ea16c51059062338e2c26bf21c'
         'a2ac2405a9ca39c50885d478ff20a2d3'
         '049acbc207e30daf7e64387db0bad1cb'
         '43b27e03f8804d4da4011225e99c905e'
         '87b88f31f990478f5596d3d911fd6135'
         '2265ba50666e20f55b35223e95aed014')
