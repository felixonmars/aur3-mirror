# Maintainer: Dan Vratil <dan@progdan.cz>

pkgname=vaucanson-g
pkgver=0.4
pkgrel=1
pkgdesc="A LaTeX package for drawing automata and graphs"
url="http://igm.univ-mlv.fr/~lombardy/Vaucanson-G/"
arch=(any)
license=('unknown')
depends=('texlive-core' 'texlive-pstricks')
install=vaucanson-g.install
source=(http://igm.univ-mlv.fr/~lombardy/Vaucanson-G/Arch/vaucanson-g.tgz)

package() {
	cd ${srcdir}/${pkgname}

	for f in vaucanson-g.sty Vaucanson-G.tex VCColor-names.def \
		 VCPref-{default,slides,beamer,mystyle}.tex; do

		install -D -m644 ${f} \
			${pkgdir}/usr/share/texmf/tex/latex/$pkgname/${f}

	done
}

md5sums=('0e73438d9b7f3976dd1e063cda77ff4e')
