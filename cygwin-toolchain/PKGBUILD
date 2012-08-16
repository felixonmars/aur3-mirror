# Maintainer: Anders Mårtensson <anders@nemrod.se>
pkgname=cygwin-toolchain
pkgver=4.5.4
pkgrel=1
pkgdesc="Repackaged Fedora RPMs for the Cygwin cross-compiler."
arch=('x86_64')
url="http://sourceforge.net/projects/fedora-cygwin/"
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=()
makedepends=('rpmextract')
options=('!strip' 'emptydirs')
source=("ftp://ftp.cygwinports.org/pub/cygwinports/fedora-cygwin/RPMS/noarch/cygwin-1.7.15-1.noarch.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-binutils-2.22.51-2.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-cpp-4.5.3-4.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-gcc-4.5.3-4.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-gcc-c++-4.5.3-4.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-gcc-gfortran-4.5.3-4.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-gcc-java-4.5.3-4.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-gcc-objc++-4.5.3-4.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/FC17/RPMS/x86_64/cygwin-gcc-objc-4.5.3-4.fc17.x86_64.rpm"
        "ftp://ftp.cygwinports.org/pub/cygwinports/fedora-cygwin/RPMS/noarch/cygwin-w32api-3.17-3.fc14.noarch.rpm")
md5sums=('4416c9bcf4fdd93d53687999e2185264'
         '644573b39363733be8b701da32a03539'
         '15f34d65fc587959d38789f1bd86792d'
         '43a1b2654f989f16388e8a01c9e376de'
         '9cbe33f8c691996203e750ff3d914387'
         '5d5dc37db51d48a049a8d70df634aeaf'
         '87cdb2a1956ee24039ea45a692d8b498'
         'fccd6825284452e4e2dd5fdb605d9cfa'
         'dc52f048b2fd077395cf8078d44cd1b8'
         '2f6127c8eda04d2c745cf5374b3aa068')
#build() {
  #cd "$pkgdir"
  #rpm2cpio *.rpm | xz -d | cpio -id
#}
package() {
  mv $srcdir/* $pkgdir
  mkdir -p $pkgdir/usr/lib
  ln -s /usr/lib/libcloog-isl.so $pkgdir/usr/lib/libcloog.so.0
  ln -s /usr/lib/libppl.so $pkgdir/usr/lib/libppl.so.9
}