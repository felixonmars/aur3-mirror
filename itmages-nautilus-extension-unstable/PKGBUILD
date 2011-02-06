# Contributor: Voldemar Khramtsov <harestomper@gmail.com>

pkgname=itmages-nautilus-extension-unstable
pkgver=0.14
pkgrel=1
pkgdesc="Scripts for uploading pictures to ITmages.ru"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~itmages/itmages/itmages-nautilus-extension-unstable"
license=('GPL')
groups=('graphics')
depends=('nautilus' 'python>=2.5' 'python-pycurl' 'pygtk' 'kaa-imlib2')
makedepends=('bzr' 'bzrtools')
#provides=()
conflicts=("nautilus-itmages-extension")
#replaces=()
install='nautilus-extension.install'
source=(
#        "http://aur.archlinux.org/packages/${pkgname}/${pkgname}/${pkgname}.tar.gz"
        "nautilus-extension.install")

build() {
    cd "${srcdir}"
    bzr branch lp:~itmages/itmages/itmages-nautilus-extension-unstable

    cd "${srcdir}/${pkgname}/scripts"
    EXTENSION="itmages-extension"
    gcc -DPIC -fPIC -c "./$EXTENSION.c" `pkg-config --cflags gtk+-2.0,glib-2.0,libnautilus-extension,gconf-2.0` || return 1
    gcc -shared -o "lib${EXTENSION}.so" "./$EXTENSION.o" || return 1

    cd "${srcdir}/${pkgname}"
    /bin/bash ./setver.sh $(echo $(bzr log | awk '$1~/revno:/{print $2}') | awk '{print $1}')
    python2 ./setup.py install --archlib=lib --compile --optimize=2 --prefix="${pkgdir}/usr"
    
}

# vim:set ts=2 sw=2 et:

md5sums=('11e1645b237257345635712431f97ad6')
md5sums=('66acf4bd1cc857694b7b0fb6f5f5d871')
