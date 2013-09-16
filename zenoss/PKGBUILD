# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

# Reference: https://raw.github.com/hydruid/zenoss/master/core-autodeploy/4.2.4/zenoss424_ub1304_alpha.sh

pkgname=zenoss
pkgver=4.2.4_1897.el6
pkgrel=2
pkgdesc="Monitors and manages your entire, dynamic IT infrastructure"
arch=('i686' 'x86_64')
url="http://www.zenoss.org"
license=('custom')
depends=('rrdtool' 'swig' 'python2' 'python2-setuptools' 'python2-six')
source=("http://softlayer-dal.dl.sourceforge.net/project/zenoss/zenoss-4.2/zenoss-4.2.4/4.2.4-1897/zenoss_core-4.2.4-1897.el6.src.rpm")
sha512sums=('16140f7b89a1236c1beb4b2917ac631be9641840db286a97eaa7e81ee14ca7354292a911e4a77c3880b3974dbd3c39b06831163b572c8ee983002668cc9cafe6')

build() {
    cd $srcdir/
    tar xf zenoss_core-4.2.4-1897.el6.x86_64.tar.bz2
    cd zenoss_core-4.2.4 
    ./configure DESTDIR="${pkgdir}/"
}

package() {
    cd $srcdir/zenoss_core-4.2.4
    sed -i '/\tsetuptools-install/d' GNUmakefile
    sed -i 's/setuptools-install six-install//' GNUmakefile
    PYTHON=python2 make
}

# vim:set ts=4 sw=4 et:
