# Maintainer: Petronio Padilha <petroniopadilha@gmail.com.br>

pkgname=irpf2012
pkgver=1.0
pkgrel=0
pkgdesc='Programa oficial da Receita da Fazenda para elaboração do IRPF de 2012.'
url="http://www.receita.fazenda.gov.br/"
makedepends=('rpmextract' 'jre6')
optdepends=('receitanet: Programa para transmitir pela internet a declaração')
options=('emptydirs')
source=("http://www28.receita.fazenda.gov.br/publico/programas/IRPF/2012/PGDIRPF2012/Java/Linux/$pkgname-$pkgver-$pkgrel.noarch.rpm")
md5sums=('e1a452407444cd35b15e3c42d6f13133')
license=('unknown')
arch=('any')

build() {
	cd $pkgdir
	rpmextract.sh ../$pkgname-$pkgver-$pkgrel.noarch.rpm
}


