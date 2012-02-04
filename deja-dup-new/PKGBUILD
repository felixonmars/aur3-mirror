# Contributor: polslinux <garrett16@hotmail.it>, jijijaco <jijijaco@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at

pkgname=deja-dup-new
_pkgname=deja-dup
pkgver=19.90
_pkgmain=20
pkgrel=1
pkgdesc="Déjà   Dup is a simple backup program. It hides the complexity of doing backups the 'right way' (encrypted, off-site, and regular) and uses duplicity as the backend."
arch=('i686' 'x86_64')
url="https://launchpad.net/deja-dup"
license=('GPL')
depends=('nautilus' 'duplicity>=0.6.8' 'libnotify'  'gtk3'  'gnome-keyring' 'gnome-doc-utils>=0.3.2' 'itstool')
makedepends=('intltool' 'perl-locale-gettext')
optdepends=('python-boto' 'python-rackspace-cloudfiles' 'gnome-control-center')
provides=('deja-dup')
conflicts=('deja-dup')
install=deja-dup.install
source=("http://launchpad.net/${_pkgname}/${_pkgmain}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('1d6e4fedef37d46c7a881ee109993861')

build() {

    cd ${srcdir}/deja-dup-${pkgver} 
    ./configure --prefix=/usr --exec-prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc
    make
}

check(){
    cd ${srcdir}/deja-dup-${pkgver}
    make check
}

package () {
    cd ${srcdir}/deja-dup-${pkgver}
    make DESTDIR="${pkgdir}" install
}
