# Maintainer: Taylor Hedberg <t@tmh.cc>

pkgname=ike
pkgver=2.1.7
pkgrel=3
pkgdesc='Shrew Soft VPN client for Linux'
arch=(i686 x86_64)
url='http://www.shrew.net'
license=(BSD)
depends=(openssl qt3)
makedepends=(cmake)
optdepends=(openldap)
backup=(etc/iked.conf)
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tgz" ike.rc.d)
md5sums=(8551a521066fcad988b222921a905723 4ef4e837e93a3b39bed8545d6bb2a565)

build () {
    cd "$srcdir/ike"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES \
        -DQT_QT_LIBRARY=/opt/qt/lib/libqt-mt.so \
        -DQT_INCLUDE_DIR=/opt/qt/include -DQT_MOC_EXECUTABLE=/opt/qt/bin/moc \
        -DQT_UIC_EXECUTABLE=/opt/qt/bin/uic -DMANDIR=/usr/share/man
    make
}

package () {
    cd "$srcdir/ike"
    make DESTDIR="$pkgdir/" install
    install -Dm 755 $srcdir/ike.rc.d $pkgdir/etc/rc.d/iked
    mv $pkgdir/etc/iked.conf{.sample,}
}
