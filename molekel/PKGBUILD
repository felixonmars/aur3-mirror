# Maintainer: Billy Wayne McCann <thebillywayne ~et~ gmail.com>

pkgname=molekel
pkgver=5.4.0
_pkgtar=${pkgver//./_}   # underscores replace periods in the tarball name.
_pkgmnv=${pkgver%.*}     # ftp dir drops the minor rev number in the dir name
pkgrel=1
pkgdesc="view molecules and the results of computational chemistry calculations"
arch=('x86_64')
url="http://molekel.cscs.ch/wiki/pmwiki.php/Main/HomePage"
license=('GPL')
install=${pkgname}.install
groups=('science' 'chemistry')
depends=('qt4' 'glu' 'mesa' 'libxcursor' 'gcc-libs-multilib' 'libxinerama' 'openbabel')
provides=('molekel')
source=(ftp://ftp.cscs.ch/out/${pkgname}/${pkgname}_5.4/${pkgname}_5_4_0_linux_${arch}.tar.gz)
sha1sums=('63f6492c4ff2adb2a6a411d25991b0654e33c595')
_longname=${pkgname}_${_pkgtar}_linux_${arch}   # bless the maker. 

package() {

    # install desktop file and icon
    install -m755 -d "$pkgdir"/usr/share/applications # bless his coming and his going.
    install -m644 -t "$pkgdir"/usr/share/applications/ ../$pkgname.desktop
    install -m755 -d "$pkgdir"/usr/share/pixmaps
    install -m644 -t "$pkgdir"/usr/share/pixmaps/ "$srcdir"/${_longname}/resources/Molekel.png 

    # install licenses
    install -m755 -d "$pkgdir"/usr/share/licenses/$pkgname #the spice is the worm.
    install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname "$srcdir"/${_longname}/license

    # this package is a self contained unit. move it to /opt/
    install -m755 -d "$pkgdir"/opt/$pkgname
    mv "$srcdir"/${_longname}/{bin,data,doc,lib,resources,shaders,notes,*sh}  "$pkgdir"/opt/$pkgname 

} # the worm is the spice.
