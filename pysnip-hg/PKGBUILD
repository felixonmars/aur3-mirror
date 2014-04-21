# Maintainer: Samuel Walladge
pkgname=pysnip-hg
_pkgname=pysnip
pkgver=a7e990e92b06
pkgrel=4
pkgdesc="PySnip is an open-source Python server implementation for the voxel-based game 'Ace of Spades'."
arch=('any')
url="https://bitbucket.org/NateShoffner/pysnip/"
license=('GPL')
groups=()
makedepends=('mercurial')
depends=('python2>=2.7' 'python2-setuptools' 'twisted' 'gcc' 'python2-zope-interface' 'cython2' 'python2-pillow' 'python2-jinja')
optdepends=('screen: ability to run in screen multiplexor' "python2-pygeoip: to use the 'from' command.")
provides=('pysnip')
source=("https://bitbucket.org/NateShoffner/pysnip/get/default.tar.gz"
        "pysnip"
        "pysnip-hg.install")
md5sums=('22809e597ce0959cbccb2dceec49c11f'
         'ce54071a381e19443fe5454fb5a676a0'
         '95b36472fa2e0ec5222a9acfdb04c94c')
install=${pkgname}.install

build() {
    cd "NateShoffner-$_pkgname-$pkgver/"

    sed -i "s/python /python2 /g" build_all.sh
    sh build_all.sh
}

package() {

    install -d "${pkgdir}/usr/bin/"
    install -Dm644 pysnip "${pkgdir}/usr/bin/pysnip"
    chmod +x "${pkgdir}/usr/bin/pysnip"

    cd "NateShoffner-$_pkgname-$pkgver/"

    datadir="$pkgdir/usr/share/pysnip"
    install -d $datadir

    # tidy up
    rm -r enet/build
    cp feature_server/config.txt.default feature_server/config.txt
    
    cp -R {contrib,data,enet,examples,experimental,feature_server,images,py2exe,pyspades,site,tools} $datadir

    # add log directory
    mkdir $datadir/feature_server/logs/

    chmod -R 755 $datadir

    # add the logfile
    touch $datadir/feature_server/logs/log.txt
    chmod 777 $datadir/feature_server/logs/log.txt 
}

