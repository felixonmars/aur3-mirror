# Maintainer: Abe Hager <abe.hager@gmail.com>
pkgname=openpilot_gcs-bin
pkgver=RELEASE.14.10
pkgrel=1
pkgdesc="OpenPilot GCS (ground control station), binary version."
arch=('i686' 'x86_64')
url="http://www.openpilot.org/"
downloadurl="http://wiki.openpilot.org/download/attachments/2457605/"
license=('GPL')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('openpilot-git')
changelog=
if [ $CARCH == 'i686' ]; then
    source=($downloadurl'OpenPilot-RELEASE-14.10-i386.deb')
    md5sums=('ed533e0fad1201a9774b86b6c7ca4a49')
elif [ $CARCH == 'x86_64' ]; then
    source=($downloadurl'OpenPilot-RELEASE-14.10-amd64.deb')
    md5sums=('08cf3b9e3f19f5ae27d7488d20864081')
fi
noextract=()

prepare() {
    cd $srcdir
    tar -xjf data.tar.bz2
}

package() {
    cp -r "$srcdir/etc" "$pkgdir"
    cp -r "$srcdir/lib" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
}
