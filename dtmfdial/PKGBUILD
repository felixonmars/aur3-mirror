# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Rick Rein <jeebusroxors@gmail.com>
# Contributor: Izaak Branderhorst <izaak@victoria.tc.ca>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=dtmfdial
pkgver=0.2
pkgrel=4
pkgdesc="Command-line DTMF tone dialer"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
url='http://www.ibiblio.org/pub/linux/apps/sound/misc/'
install=$pkgname.install
changelog=ChangeLog
source=("http://www.ibiblio.org/pub/linux/apps/sound/misc/dtmf-dial-${pkgver}.tar.gz")
sha256sums=('4714878832bfeaa387d57eb5cb52c9c2816c460023198c98cb714f8ef2414c27')

build() {
    cd "${srcdir}/dial"
    make 
}

package() {
    cd "${srcdir}/dial"
    install -D -m 755 dial "${pkgdir}/usr/bin/dial"

    # documentation
    install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 README TODO "${pkgdir}/usr/share/doc/${pkgname}"
}

