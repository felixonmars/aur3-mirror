# Maintainer: Daniel <packages@post.danielnoegel.de>
# Contributor: Daniel <packages@post.danielnoegel.de> 
pkgname=pyinputstats-bzr
pkgver=26
pkgrel=2
pkgdesc="An application for mouse and keyboard statistics"
arch=("any")
url="https://launchpad.net/pyinputstats"
license=("GPL")
groups=()
provides=()
depends=('python-xlib' 'python-pysqlite' )
makedepends=()
conflicts=()
replaces=()
backup=()
source=()
md5sums=()

_bzrmod=pyinputstats
_bzrtrunk=lp:pyinputstats

build() {
    cd "${srcdir}"

    bzr branch ${_bzrtrunk} -q

    #cd ${pkgdir}
    
    #~ mkdir -p ${pkgdir}/usr/{bin,share/{,apps/pyinputstats}}
    #~ cp -R ${srcdir}/${_bzrmod}/* ${pkgdir}/usr/share/apps/pyinputstats
    #~ ln -s /usr/share/apps/pyinputstats/pyinputstats ${pkgdir}/usr/bin/pyinputstats
    
    cd pyinputstats
    python2 setup.py install --root="$pkgdir"
    

}
