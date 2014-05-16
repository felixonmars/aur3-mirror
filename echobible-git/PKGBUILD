# Maintainer: James Polanco <jpolcol@gmail.com>
pkgname=echobible-git
pkgver=r7.2ad322c
pkgrel=1
pkgdesc="a bible reader for the commandline"
arch=(any)
url="https://bitbucket.org/jpolcol/echobible"
license=('GPL3')
makedepends=('git')
depends=('bash' 'gawk')
optdepends=('festival: TTS support'
    'dict: Dictionary support')
source=(git+https://jpolcol@bitbucket.org/jpolcol/echobible)
md5sums=('SKIP')

pkgver() {
    cd echobible
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd echobible
    install -Dm755 echobible "${pkgdir}/usr/bin/echobible"
    install -d "$pkgdir/usr/share/licenses/echobible"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/echobible"
    install -d "$pkgdir/usr/share/echobible"
    install -Dm644 README "${pkgdir}/usr/share/echobible"
    install -Dm644 TODO "${pkgdir}/usr/share/echobible"
    install -Dm644 INSTALL "${pkgdir}/usr/share/echobible"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/echobible"
    install -Dm644 CHANGELOG "${pkgdir}/usr/share/echobible"
    install -Dm644 kjv-pce "${pkgdir}/usr/share/echobible"
    install -Dm644 kjv-pce-concordance "${pkgdir}/usr/share/echobible"
}
