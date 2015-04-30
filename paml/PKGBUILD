# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=paml
pkgver=4.8a
_basever=4.8
pkgrel=1
pkgdesc="The PAML (Phylogenetic Analysis by Maximum Likelihood) package of programs, including codeml and baseml"
arch=('i686' 'x86_64')
url="http://abacus.gene.ucl.ac.uk/software/paml.html"
license=('custom')
source=("http://abacus.gene.ucl.ac.uk/software/$pkgname$pkgver.tgz")
md5sums=('be5ff973a1cf8f70a5307ab48d07569a')

prepare() {
	cd "$srcdir/$pkgname$_basever"
    sed -n '/PAML is distributed/p' README.txt > LICENSE
}

build() {
	cd "$srcdir/$pkgname$_basever/src"
	make
}

package() {
	cd "$srcdir/$pkgname$_basever/src"
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 baseml "${pkgdir}/usr/bin/baseml"
    install -m755 basemlg "${pkgdir}/usr/bin/basemlg"
    install -m755 codeml "${pkgdir}/usr/bin/codeml"
    install -m755 pamp "${pkgdir}/usr/bin/pamp"
    install -m755 evolver "${pkgdir}/usr/bin/evolver"
    install -m755 yn00 "${pkgdir}/usr/bin/yn00"
    install -m755 chi2 "${pkgdir}/usr/bin/chi2"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
