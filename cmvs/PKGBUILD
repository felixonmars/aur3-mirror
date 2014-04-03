# Maintainer: Your Name Gunther Schulz < mail at guntherschulz.de >
pkgname=cmvs
pkgver=1.2
pkgrel=1
pkgdesc="Clustering Views for Multi-view Stereo (CMVS)"
arch=('i686' 'x86_64')
url="http://www.di.ens.fr/cmvs/"
license=('propriatary')
groups=()
depends=( 'bundler' 'graclus'  )
makedepends=( 'pmvs' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.di.ens.fr/cmvs/cmvs-fix2.tar.gz" )
noextract=()
md5sums=('16a6c614a081c276aa24f0986b989ba0')

build() {
        cd "${srcdir}/${pkgname}/program/main"
        
        sed -i '1s/^/#include <vector>\n/' ../base/cmvs/bundle.cc
        sed -i '1s/^/#include <numeric>\n/' ../base/cmvs/bundle.cc
        sed -i '1s/^/#include <stdlib.h>\n/' genOption.cc

        sed -i 's_Your INCLUDE path [\(]e.g., -I/usr/include[\)]__g' Makefile
        #sed -i "s_YOUR_INCLUDE_PATH =_YOUR_INCLUDE_PATH = -I/usr/include_" Makefile

        sed -i 's_Your metis directory [\(]contains header files under graclus1.2/metisLib/[\)]__g' Makefile
        sed -i "s!YOUR_INCLUDE_METIS_PATH =!YOUR_INCLUDE_METIS_PATH = -I/opt/graclus/metisLib!" Makefile
        #sed -i "s!YOUR_INCLUDE_METIS_PATH =!YOUR_INCLUDE_METIS_PATH = -I/var/abs/local/graclus/src/graclus1.2/metisLib!" Makefile

        sed -i 's_Your LDLIBRARY path [\(]e.g., -L/usr/lib[\)]__g' Makefile
        #sed -i "s!YOUR_LDLIB_PATH =!YOUR_LDLIB_PATH = -L/opt/graclus!" Makefile
        #sed -i "s!YOUR_LDLIB_PATH =!YOUR_LDLIB_PATH = -L/opt/graclus/lib!" Makefile
        sed -i "s!YOUR_LDLIB_PATH =!YOUR_LDLIB_PATH = -L/var/abs/local/graclus/src/graclus1.2!" Makefile
        make clean
        cp /opt/pmvs/mylapack.o ./mylapack.o
        make depend
        make
}

package() {
        cd "${srcdir}/${pkgname}/program/main"
        #install -Dm755 -d "$pkgdir"/opt/${pkgname}
        install -d "$pkgdir"/opt/${pkgname}
        install -Dm644 -t "$pkgdir"/opt/${pkgname} *.o
        install -Dm644 -t "$pkgdir"/opt/${pkgname} *.so*
        install -Dm755 ${pkgname} "$pkgdir"/opt/${pkgname}/${pkgname}
        install -Dm755 pmvs2  "$pkgdir"/opt/${pkgname}/pmvs2
        install -Dm755 genOption "$pkgdir"/opt/${pkgname}/genOption
        install -d "$pkgdir"/usr/bin/
        ln -s /opt/${pkgname}/${pkgname} "$pkgdir"/usr/bin/
        ln -s /opt/${pkgname}/pmvs2 "$pkgdir"/usr/bin/
        ln -s /opt/${pkgname}/genOption "$pkgdir"/usr/bin/
}
