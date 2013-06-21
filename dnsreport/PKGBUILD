# Maintainer: Mateusz Micał <aysorth+aur@gmail.com>

pkgname=dnsreport
pkgrel=1
pkgver=5.15d7d2d
pkgdesc="Simple tool to query DNS servers not only about the first level of records but also the deeper ones."

arch=('any')
url="http://github.com/pidpawel/dnsreport"
license=('CC BY-NC-SA 3.0')
depends=('python' 'python-dnspython')
makedepends=('git')
source="git://github.com/pidpawel/dnsreport.git"
md5sums=('SKIP')

_gitroot="git://github.com/pidpawel/dnsreport.git"
_gitname="dnsreport"

pkgver() {
    cd ${_gitname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd ${srcdir}
    rm -rf dnsreport
    msg "Connecting to GIT server...."

    if [ -d dnsreport ] ; then
        cd dnsreport && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd ${srcdir}/dnsreport
}

package() {
    install -D -m755 ${_gitname}/dnsreport ${pkgdir}/usr/bin/dnsreport || return 1
    install -D -m644 ${_gitname}/COPYING ${pkgdir}/usr/share/licenses/dnsreport/COPYING
}
