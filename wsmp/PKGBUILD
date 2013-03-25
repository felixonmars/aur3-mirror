# Maintainer: Benjamin Chretien <chretien@lirmm.fr>

pkgname=wsmp
pkgver="13.01.30"
pkgrel=1
pkgdesc="Watson Sparse Matrix Package (WSMP) is a collection of algorithms for efficiently solving large systems of linear equations whose coefficient matrices are sparse. "
arch=('i686' 'x86_64')
url="http://researcher.watson.ibm.com/researcher/view_project.php?id=1426"
license=('custom:IBM ILAR')

if [ "$CARCH" == "x86_64" ]; then
    _archive_name="${pkgname}-Linux64-Intel"
    md5sums=('c9279438f751919c21080c38a8ad5545')
elif [ "$CARCH" == "i686" ]; then
    _archive_name="${pkgname}-Linux32"
    md5sums=('fa69838c1893c217dd4ee66ba646e15b')
fi

source=("http://www.cs.umn.edu/~agupta/lib/${_archive_name}.tar.gz")


build() {
    msg "Unpacking archive..."
    tar -zxvf ${_archive_name}.tar.gz
}

package() {
    cd ${srcdir}/${pkgname}/${_archive_name};
    msg "Installing wsmp..."

    # Copy the libraries to /usr/lib
    mkdir -p ${pkgdir}/usr/lib/${pkgname}
    cp -dr --preserve=mode,timestamp lib/* ${pkgdir}/usr/lib/${pkgname}

    # Copy the license key and the README file to /usr/share/wsmp
    mkdir -p ${pkgdir}/usr/share/${pkgname}/
    install -m644 -D wsmp.lic ${pkgdir}/usr/share/${pkgname}/
    install -m644 -D README ${pkgdir}/usr/share/${pkgname}/

    warning "License key moved to /usr/share/${pkgname}/wsmp.lic
             You will need to set the following environment variable:
             > export WSMPLICPATH=/usr/share/${pkgname}/
             Consult /usr/share/${pkgname}/README for more information"

    # Copy the license to /usr/share/licenses
    install -m644 -D license/en.html ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html
}
