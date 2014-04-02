# Maintainer: Your Name Gunther Schulz < mail at guntherschulz.de >
pkgname=bundler
pkgver=0.4
pkgrel=1
pkgdesc="Bundler: Structure from Motion (SfM) for Unordered Image Collections"
arch=('i686' 'x86_64')
url="http://www.cs.cornell.edu/~snavely/bundler/"
license=('GPL')
groups=()
#depends=( 'gcc-fortran' 'lapack' 'zlip' )
depends=( 'sift-lowe-bin' 'gcc-fortran' 'zlib' 'lapack' 'cminpack' 'f2c')
#depends=( 'gcc-fortran' 'zlib' 'lapack' )
makedepends=( 'sudo' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.cs.cornell.edu/~snavely/bundler/distr/${pkgname}-v${pkgver}-source.zip" "bundler.install")
noextract=()
md5sums=('f5970fb64fb6ea4aefd7049cb4a0bfda'
         '16b0147130ed3bd445da45ec006d2016')

build() {
        cd "$srcdir/${pkgname}-v${pkgver}-source"
        
        #todo:
        #fix paths in RunBundler.sh 
        sed -i "s/BundlerApp::BundlerApp()/BundlerApp()/" src/BundlerApp.h
        sed -i "s_\$SIFT_/opt/sift-lowe-bin/sift_" bin/ToSift.sh
        make
}

package() {
        echo '/opt/${pkgname}/lib' > ${srcdir}/${pkgname}.conf
        install -Dm644  ${pkgname}.conf "$pkgdir"/etc/ld.so.conf.d/${pkgname}.conf
        cd "$srcdir/${pkgname}-v${pkgver}-source/bin"
        install -Dm644 libANN_char.so "$pkgdir"/opt/bundler/lib/libANN_char.so
        install -Dm755 -d "$pkgdir"/opt/${pkgname}/bin
        install -Dm755 -t "$pkgdir"/opt/${pkgname} Bundle2PMVS KeyMatchFull ToSift.sh extract_focal.pl Bundle2Vis RadialUndistort bundler jhead 
}
