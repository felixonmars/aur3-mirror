# Maintainer: Gris Ge <fge@redhat.com>
pkgname=libstoragemgmt-git
_pkgname=libstoragemgmt
pkgver=0.1.0.r88.gda72664
pkgrel=1
pkgdesc="Storage array management library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libstoragemgmt/"
license=('LGPL2+')
depends=('openssl' 'yajl' 'libxml2' 'glib2' 'pywbem' 'python2>=2.7')
makedepends=('openssl' 'yajl' 'libxml2' 'check' 'python2>=2.7' 'glib2' 'pywbem')
source=("${_pkgname}::git://git.code.sf.net/p/libstoragemgmt/code")
md5sums=('SKIP')
install='libstoragemgmt-git.install'

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}/"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}/"
    make DESTDIR=$pkgdir install
    msg "Installing systemd service file: libstoragemgmt.service"
    install -Dm644 packaging/daemon/libstoragemgmt.service \
        ${pkgdir}/lib/systemd/system/libstoragemgmt.service
    mkdir -p ${pkgdir}/var/run/lsm/ipc
    install -Dm644 tools/udev/90-scsi-ua.rules \
        ${pkgdir}/lib/udev/rules.d/90-scsi-ua.rules
    msg "Done"
}
