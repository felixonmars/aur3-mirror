# Maintainer: Johannes Wienke <languitar at semipol dot de>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Kevin Kyzer <kevin@imsmrt.com>

pkgname=backintime-kde4
pkgver=1.0.24
pkgrel=2
pkgdesc="Back In Time is a simple backup system for Linux inspired from 'flyback project' and 'TimeVault'. KDE 4 version"
arch=('any')
url="http://backintime.le-web.org/"
license="GPL"
depends=('rsync' 'cron' 'python2' 'xorg-utils' 'python2-pyqt4' 'kdebindings-python2' 'python2-keyring')
conflicts=('backintime')
provides=('backintime')
source=(http://backintime.le-web.org/wp-content/uploads/2009/03/backintime-${pkgver}.tar.gz)
md5sums=('7bb3a3ec192c12384a4fb2fb9b3e15b1')

build() {
    cd $srcdir/common
    ./configure
    make || return 1

    cd $srcdir/kde4
    ./configure
    make || return 1
}

package(){
    cd $srcdir/common
    make DESTDIR=${pkgdir} install || return 1
    sed -i -e 's/python/python2/g' ${pkgdir}/usr/bin/backintime
    sed -i -e 's/python/python2/g' ${pkgdir}/usr/share/backintime/common/askpass.py

    cd $srcdir/kde4
    make DESTDIR=${pkgdir} install || return 1
    sed -i -e 's/python/python2/g' ${pkgdir}/usr/bin/backintime-kde4
}
