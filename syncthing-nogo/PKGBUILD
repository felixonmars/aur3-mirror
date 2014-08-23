# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-nogo
_gitname=syncthing
pkgver=0.9.6
pkgrel=1
_pkgarch=amd64
pkgdesc="File synchronization tool, without Go dependency"
url="http://syncthing.net/"
license=('MIT')
arch=('armv6h' 'x86_64')
conflicts=('syncthing')
provides=('syncthing')
source=("https://github.com/calmh/${_gitname}/releases/download/v${pkgver}/${_gitname}-linux-amd64-v${pkgver}.tar.gz"
        "syncthing@.service"
        "syncthing.1")
sha1sums=('2003feb7980c8979d5a4b53812e1394ea071a497'
          '204cad3823306c793a14a17a23220e26199160d4'
          'cabf3bf78457ce17057ae39fe3b0009a4aa446c4')
install=${_gitname}.install

if [ "$CARCH" == "armv6h" ]; then
    _pkgarch="armv6"
    sha1sums[0]='6127edc09417268634e362d00f1df013f9fda829'
    source[0]="https://github.com/calmh/${_gitname}/releases/download/v${pkgver}/${_gitname}-linux-armv6-v${pkgver}.tar.gz"
fi

package() {
    cd "${_gitname}-linux-${_pkgarch}-v${pkgver}"
    install -D -m 755 syncthing "${pkgdir}/usr/bin/syncthing"
    install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
    install -D -m 644 README.txt "${pkgdir}/usr/share/doc/${_gitname}/README.md"
    install -D -m 644 "${srcdir}/syncthing@.service" "${pkgdir}/usr/lib/systemd/system/syncthing@.service"
    install -D -m 644 "${srcdir}/${_gitname}.1" "${pkgdir}/usr/share/man/man1/${_gitname}.1"
}
