# Maintainer: Your Name Gunther Schulz < mail at guntherschulz.de >
pkgname=vsfm
pkgver=0.5
pkgrel=1
pkgdesc="VisualSFM : A Visual Structure from Motion System"
arch=('x86_64')
url="http://ccwu.me/vsfm/"
license=('proprietary')
groups=()
#depends=( 'pba' 'libsiftgpu' 'cmvs' )
#http://www.10flow.com/2012/08/15/building-VisualSFM-on-ubuntu-12-04-precise-pangolin-desktop-64-bit/
#depends=( 'fortran' 'gsl' 'freeglut' 'pba' 'libsiftgpu' 'atlas' 'boost' 'gtk2' 'imagemagick' 'cminpack' 'metis-edf' 'parmetis' )
#depends=( 'fortran' 'gsl' 'freeglut' 'pba' 'libsiftgpu' 'atlas' 'boost' 'gtk2' 'imagemagick' 'cminpack' 'metis' 'parmetis' )
depends=( 'gcc-fortran-multilib' 'gsl' 'freeglut' 'pba' 'libsiftgpu' 'atlas' 'boost' 'gtk2' 'imagemagick' 'cminpack' 'metis' 'parmetis' )
makedepends=( )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://ccwu.me/vsfm/download/VisualSFM_linux_64bit.zip)
noextract=()
md5sums=('aea69344167b49d757684029f8c99c74')

build() {
        cd "$srcdir/${pkgname}"
        make
}

package() {
        cd "$srcdir/${pkgname}"
        install -d "$pkgdir"/opt/vsfm
        install -Dm777 -d "$pkgdir"/opt/vsfm/log
        install -Dm755 bin/VisualSFM  "$pkgdir"/opt/vsfm/VisualSFM
        install -d "$pkgdir"/usr/bin/
        ln -s /opt/${pkgname}/VisualSFM "$pkgdir"/usr/bin/
        #ln -s /usr/lib/libsiftgpu.so "$pkgdir"/opt/vsmf/lib/libsiftgpu.so
        #ln -s /usr/lib/libpba.so "$pkgdir"/opt/vsmf/lib/libpba.so
        #ln -s /opt/cmvs/cmvs "$pkgdir"/opt/${pkgname}/cmvs
        #ln -s /opt/cmvs/pmvs2 "$pkgdir"/opt/${pkgname}/pmvs2
        #ln -s /opt/cmvs/genOption "$pkgdir"/opt/${pkgname}/genOption
}
