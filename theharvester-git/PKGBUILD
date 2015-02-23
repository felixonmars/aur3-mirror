# Maintainer: Joshua Strot <joshuastrot@mail.com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=theharvester-git
_pkgname=theHarvester
pkgver=2.5
pkgrel=2
pkgdesc="Python tool for gathering e-mail accounts and subdomain names from different public sources (search engines, pgp key servers)"
url="https://github.com/laramies/${_pkgname}"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git')
depends=('python2' 'python2-requests')
provides=('theharvester')
conflicts=('theharvester')
source=("git://github.com/laramies/$_pkgname.git")
sha1sums=('SKIP')

package() {
    cd "$_pkgname"
    sed -i '1s|python|python2|' ${_pkgname}.py
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.py"
    install -m644 myparser.py "${pkgdir}/usr/share/${_pkgname}/myparser.py"
    cp -r discovery "${pkgdir}/usr/share/${_pkgname}/"
    cp -r lib "${pkgdir}/usr/share/${_pkgname}/"
    install -Dm644 README "${pkgdir}/usr/share/${_pkgname}/doc/README"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname,,}"
}
