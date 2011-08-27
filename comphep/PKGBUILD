#Contributor: T.Cunly
#License:Non-profit Use License Agreement

pkgname=comphep
pkgver=4.5.1
pkgrel=1
pkgdesc="A package for evaluation of Feynman diagrams, integration over multi-particle phase space and event generation."
license=(NULA)
arch=('x86_64')
url="http://comphep.sinp.msu.ru"
depends=('lhapdf' 'root-stable')
install=comphep.install
source=("http://comphep.sinp.msu.ru/_media/download/$pkgname-$pkgver.tgz")
md5sums=('9b5afbe99912b2b9d9cc405aa60024b5')

build() {
    INSTALLDIR=/opt/Science

    if [ ! -d $pkgdir$INSTALLDIR ] 
    then 
            mkdir -p $pkgdir$INSTALLDIR 
    fi
    cd $pkgdir$INSTALLDIR
    cp  $startdir/$pkgname-$pkgver.tgz ./
    tar xvpf $pkgname-$pkgver.tgz 
    mv $pkgname-$pkgver CompHEP 
    rm -f $pkgname-$pkgver.tgz
    cd $pkgdir$INSTALLDIR/CompHEP 

    export LHAPDFPATH=/usr/lib/liblhapdf.a
    export ROOTSYS=/usr

    ./configure --with-gcc4 --with-lhapdf --with-libxml --optimise --with-m64 --with-root || return 1
    make || return 1
    make clean
}
