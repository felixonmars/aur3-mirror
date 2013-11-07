# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=python2-cudamat-hg
pkgver=279
pkgrel=1
pkgdesc="A Python matrix class that uses CUDA for performing computations."
arch=('i686' 'x86_64')
url="https://code.google.com/p/cudamat"
license=('New BSD')
depends=('python2-numpy' 'cuda' 'python2-nose' 'python2-scipy')
makedepends=('mercurial')
source=('fix_path.patch')
# Do you get 404 errors if you use the standard "_hgroot" and "_hgrepo"?
__hgroot=https://cudamat.googlecode.com/hg/
__hgrepo=cudamat

prepare() {
    cd $srcdir

    msg "Connecting to $__hgroot"
    if [ -d $__hgrepo ]; then
        cd $__hgrepo
        hg pull -u || return 1
        msg2 "Finished updating the local repository!"
    else
        hg clone $__hgroot $__hgrepo || return 1
        msg2 "Initial pull complete!"
    fi
    cd ${srcdir}/cudamat
    patch cudamat.py < ${srcdir}/fix_path.patch 
}
build() {
    cd $srcdir
    rm -rf ${srcdir}/${__hgrepo}-build
    cp -a ${srcdir}/${__hgrepo} ${srcdir}/${__hgrepo}-build || return 1
    cd ${srcdir}/${__hgrepo}-build

    make
}

package() {
    cd ${srcdir}/${__hgrepo}-build
    mkdir -p ${pkgdir}/usr/lib/python2.7/site-packages/cudamat/
    cp -R * ${pkgdir}/usr/lib/python2.7/site-packages/cudamat/
}
md5sums=('0d559da79b0f36c7537c0bc5b216c368')
