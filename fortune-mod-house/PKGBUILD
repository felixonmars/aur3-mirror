pkgname=fortune-mod-house
pkgver=20140217
pkgrel=2
pkgdesc="Fortune quotes from House, M.D. (Thanks to maandree for his wikiquote-fortune tool)"
arch=('any')
license=('custom:cc-sa-3.0')
url=("http://en.wikiquote.org/wiki/House")
depends=('fortune-mod')
makedepends=('coreutils' 'wikiquote-fortune>=1.3')

prepare(){
    mkdir "${srcdir}/${pkgname}"
    cd "${srcdir}/${pkgname}"

    for i in {1..8..1}; do
      wikiquote-fortune "House (Season ${i})"
      cat quotes | tail -n +5 | sed -e "s|House (Season [1-8])|House|g" -e "s|(\([0-9]*\)|[\1|g" -e "s|\([0-9]*\))|\1]|" >> house
    done
    rm quotes
    strfile house
}

package()
{
    cd "${srcdir}/${pkgname}"
    install -dm755 -- "${pkgdir}/usr/share/fortune"
    install -m644 -- house house.dat "${pkgdir}/usr/share/fortune"
}

