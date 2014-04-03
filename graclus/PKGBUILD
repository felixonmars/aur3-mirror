# Maintainer: Your Name Gunther Schulz < mail at guntherschulz.de >
pkgname=graclus
pkgver=1.2
pkgrel=1
pkgdesc="Graclus (latest: Version 1.2) is a fast graph clustering software that computes normalized cut and ratio association for a given undirected graph without any eigenvector computation."
arch=('x86_64')
url="http://www.cs.utexas.edu/users/dml/Software/graclus.html"
license=('GPL')
groups=()
depends=()
makedepends=( )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
source=("${pkgname}${pkgver}.tar.gz" "${pkgname}.conf" "${pkgname}.install")
noextract=()
md5sums=('7e6a81037632f11d52e6800f7212ab2d'
         '8a489054b80a683011a70da403c480b2'
         '353ddc872e23ad2959f3dcd4357060b4')

build() {
        cd "${srcdir}/${pkgname}${pkgver}"
        make COPTIONS=-DNUMBITS=64 
}

package() {
        install -Dm644  ${pkgname}.conf "$pkgdir"/etc/ld.so.conf.d/${pkgname}.conf
        cd "${srcdir}/${pkgname}${pkgver}"
        #install -Dm644 libmultilevel.a "${pkgdir}/opt/graclus/lib/libmultilevel_a"
        install -Dm644 libmultilevel.a "${pkgdir}/opt/graclus/libmultilevel_a"
        #install -Dm644 libmultilevel.a "${pkgdir}/opt/graclus/lib/libmetis_a"
        install -Dm644 libmultilevel.a "${pkgdir}/opt/graclus/libmetis_a"
        # does not work on files *a for some reason
        # post install renames
        #install -Dm755 -t "$pkgdir"/opt/${pkgname}/lib ./*.a
        install -Dm755 -d "$pkgdir"/opt/${pkgname}/metisLib
        install -Dm644 -t "$pkgdir"/opt/${pkgname}/metisLib metisLib/*.o
        install -Dm644 -t "$pkgdir"/opt/${pkgname}/metisLib metisLib/*.h
        install -Dm755 -d "$pkgdir"/opt/${pkgname}/multilevelLib
        install -Dm644 -t "$pkgdir"/opt/${pkgname}/multilevelLib multilevelLib/*.o
        #install -Dm755 ${pkgname} "$pkgdir"/opt/${pkgname}/bin/${pkgname}
        install -Dm755 ${pkgname} "$pkgdir"/opt/${pkgname}/${pkgname}
        install -d "$pkgdir"/usr/bin/
        ln -s /opt/${pkgname}/${pkgname} "$pkgdir"/usr/bin/
        

}
