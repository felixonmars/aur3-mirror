# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=liburcu-git
_gitname="userspace-rcu"
pkgver=v0.7.4.203.ga5bae03
pkgrel=2
pkgdesc="LGPLv2.1 userspace RCU (read-copy-update) library"
arch=('i686' 'x86_64')
url="http://lttng.org/urcu"
license=('LGPL2.1')
provides=('liburcu')
conflicts=('liburcu')
makedepends=('git')
depends=('glibc')
options=('!libtool')
source=('git://git.lttng.org/userspace-rcu.git')
sha1sums=('SKIP')

pkgver()
{
    cd ${_gitname}
    git describe --always | sed 's|-|.|g'
}

build()
{
    cd ${_gitname}
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${_gitname}
    make install DESTDIR=${pkgdir}
}
