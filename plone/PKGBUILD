# Contributor: Benjamin Hedrich <phpogo@gmx.net> 
# Contributor: Ben Reedy <thebenj88 *AT* gmail *DOT* com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=plone
pkgver=4.3.4
pkgrel=2
pkgdesc="A powerful, flexible Content Management solution that is easy to install, use and extend"
arch=('any')
license=('GPL2')
url="http://www.plone.org/"
depends=('python2')
makedepends=('freetype2')
conflicts=('plone-beta')
install=plone.install
source=(http://launchpad.net/plone/4.3/$pkgver/+download/Plone-$pkgver-UnifiedInstaller.tgz
        plone-standalone.service)
sha256sums=('59bf05c1ea891b3c84050bd5ac3f79596c9d7ee88bccd2da9779416ef086f4be'
            'cd32df8ff1dfb176e7827228fb9eb251053a7b5440717492a4a4e558e57dc33e')
    
package() {
    # Link needed for plone to build correctly
    install -d "$pkgdir"/usr/include
    ln -s /usr/include/freetype2 "$pkgdir"/usr/include/freetype

    install -Dm644 "$srcdir"/plone-standalone.service \
        "${pkgdir}"/usr/lib/systemd/system/plone-standalone.service

    install -d "$pkgdir"/opt/plone
    cp -r Plone-$pkgver-UnifiedInstaller "$pkgdir"/opt/Plone-$pkgver-UnifiedInstaller
}
