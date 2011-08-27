# Contributor: Vladimir Polyakov <dr.xaos@mail.ru>

pkgname=eclipse-xmind
_pkgname=xmind
pkgver=3.0.1
_pkgver=3.0.1.200812152237
pkgrel=1
pkgdesc="Xmind - Brainstorming and Mind Mapping Plugin for Eclipse"
url="http://www.xmind.net"
license=('EPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('eclipse')
source=(http://downloads.sourceforge.net/xmind3/xmind-for-eclipse-site-${_pkgver}.zip)
md5sums=('6743b46c0aa2033d9266ce55f97aeb43')

build() {
    mkdir -p $startdir/pkg/usr/share/eclipse
    
    cd $startdir/src/

    find -type d -exec chmod 755 \{\} \;
    find -type f -exec chmod 644 \{\} \;

    cp -rf features plugins $startdir/pkg/usr/share/eclipse
}
