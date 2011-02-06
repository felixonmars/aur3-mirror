pkgname=lescienze500-data
pkgver=1.0.0
pkgrel=1
pkgdesc="Copertine e database dei 500 numeri di Le Scienze"
arch=('i686' 'x86_64')
url="http://lescienze500.wordpress.com/"
license=('GPL')
depends=('lescienze500')
makedepends=('p7zip' 'bash' )

build() {
    bash ../extract_ls500.bash
}

package() {
    mkdir ${pkgdir}/opt
    mkdir ${pkgdir}/opt/LeScienze500/
    mv ${srcdir}/Le\ Scienze\ -\ 500\ Numeri/Le\ Scienze\ -\ 500\ Numeri/copertine ${pkgdir}/opt/LeScienze500/
    mv ${srcdir}/Le\ Scienze\ -\ 500\ Numeri/Le\ Scienze\ -\ 500\ Numeri/data ${pkgdir}/opt/LeScienze500/
    chmod -R a+r ${pkgdir}/opt/LeScienze500/
    chmod a+x ${pkgdir}/opt/LeScienze500/copertine
    chmod a+x ${pkgdir}/opt/LeScienze500/data
}

