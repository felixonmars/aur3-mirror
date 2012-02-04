# Maintainer: Aljosha Papsch <joschi.papsch@yahoo.de>

pkgname=nautilus-git-scripts
pkgver=20110411
pkgrel=1
pkgdesc="Nautilus scripts for interacting with a Git repository"
arch=(any)
url="https://github.com/tapio/nautilus-git-scripts"
license=('GPL2')
depends=('nautilus' 'zenity')
makedepends=('git')
install=nautilus-git-scripts.install

_gitroot="https://github.com/tapio/nautilus-git-scripts.git"
_gitname="nautilus-git-scripts"

build() {
    cd ${srcdir}
    msg "Connecting to GIT server..."
    if [ -d ${_gitname} ]; then
	cd ${_gitname} && git pull origin
	msg "The local files are updated"
    else
	git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    if [ `pwd` != ${_gitname} ]; then
	cd ${srcdir}/${_gitname}
    fi

    mkdir -p ${pkgdir}/usr/share/nautilus-git-scripts
    cp -rf Git/ ${pkgdir}/usr/share/nautilus-git-scripts
    
}
