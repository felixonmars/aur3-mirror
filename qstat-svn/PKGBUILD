# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=qstat-svn
pkgver=387
pkgrel=2
pkgdesc="A command line utility that displays the status of internet game servers"
url="http://www.qstat.org/"
arch=('i686' 'x86_64')
license=('Artistic2.0')
depends=('glibc')
makedepends=('subversion')
replaces=('qstat-cvs')
conflicts=('qstat' 'qstat-cvs')
provides=('qstat')
source=('qstat2::svn+https://qstat.svn.sourceforge.net/svnroot/qstat/trunk/qstat2')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/qstat2"
    svnversion | tr -d [A-z]
}

build() {
    cd "${srcdir}/qstat2"

    sed "s#strndup#strndupz0r#g" -i qstat.c

    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/qstat2"

    make DESTDIR="${pkgdir}" install
}
