pkgname=talisman
pkgver=1.0.0
pkgrel=1
url=('http://svn.xmpp.ru/repos/talisman/trunk/')
pkgdesc='Talisman is a Jabber bot'
depends=('subversion' 'python>=2.6')
install=(talisman.install)
license=('GPL' 'GPLv3')
arch=any
build () {
mkdir -p ${startdir}/pkg/usr/share/talisman
svn co http://svn.xmpp.ru/repos/talisman/tags/1/ ${pkgdir}/usr/share/talisman
}
