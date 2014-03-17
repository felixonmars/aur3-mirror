#Contributor:Iru Dog <mytbk920423 AT gmail.com>

pkgname=stardict-dic-en
pkgver=2.4.2
pkgrel=12
pkgdesc="English dictionary for stardict"
arch=('any')
url="http://code.google.com/p/stardict-3/"
license=('GPL')
makedepends=()
optdepends=('stardict')
conflicts=()
MIRRORURL='http://mirrors.tuna.tsinghua.edu.cn/fedora/releases/20/Everything/i386/os/Packages/s'
source=("${MIRRORURL}/${pkgname}-${pkgver}-${pkgrel}.fc20.noarch.rpm")
md5sums=('95365ff2d3a09aae1f18ef2bafac30b3')

build() {
  true
}


package() {
  cd "${pkgdir}"
  mv "${srcdir}/usr" "${pkgdir}"
}
