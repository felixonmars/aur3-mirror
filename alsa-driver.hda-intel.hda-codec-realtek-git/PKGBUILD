# Syco <SycoLTH at gmail dot com>

pkgname=alsa-driver.hda-intel.hda-codec-realtek-git
_pkgname=alsa-driver-unstable
pkgver=1.0
pkgrel=0
pkgdesc="An alternative implementation of Linux sound support"
arch=('i686' 'x86_64')
conflicts=('alsa-driver')
provides=('alsa-driver')
install='alsa-driver.install'
url="http://www.alsa-project.org"
license=('GPL')
makedepends=('wget' 'make' 'tar' 'linux-headers')
options=('!libtool')

build() {
    wget -c http://ftp.riken.go.jp/Linux/kernel/people/tiwai/snapshot/alsa-driver-unstable-snapshot.tar.bz2

    tar -xf alsa-driver-unstable-snapshot.tar.bz2
    k_updates=${pkgdir}/lib/modules/$(uname -r)/updates
    mkdir -p ${k_updates}
    cd ${srcdir}/${_pkgname}
    ./configure --with-cards=hda-intel --with-card-options=hda-codec-realtek
    make || return 1
    install -D -m644 modules/*.ko ${k_updates} || return 1
}
