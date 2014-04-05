# Maintainer: Jake Tucker <jaketckr+arch@gmail.com>
# This package requires the user to relogin in order to correctly setup environment variables

pkgname=rsm
pkgver=7.75
pkgrel=1
pkgdesc="A source code metrics and quality analysis tool"
arch=('i686' 'x86_64')
url="http://msquaredtechnologies.com/m2rsm/index.htm"
license=('custom')
depends=('glibc')
install=rsm.install
source=(http://msquaredtechnologies.com/ftp/rsm.tar.gz rsm.sh)
md5sums=(SKIP '420fe8b0bf7dc5c34de66f9351611608')

pkgver() {
    grep -Eo "Version [0-9]+.[0-9]+" readme.txt | grep -oEi "[0-9]+.[0-9]+"
}

package() {
    mkdir -p $pkgdir/etc/profile.d
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/rsm
    mkdir -p $pkgdir/usr/share/licenses/rsm/
    if [ `uname -m` = "x86_64" ]; then
        mv $srcdir/rsm.64.lnx $pkgdir/usr/bin/rsm
    else
        mv $srcdir/rsm.lnx $pkgdir/usr/bin/rsm
    fi
    mv $srcdir/*.cfg $pkgdir/usr/share/rsm
    mv $srcdir/rsm.log $pkgdir/usr/share/rsm
    mv $srcdir/license.pdf $pkgdir/usr/share/licenses/rsm/license.pdf
    mv $srcdir/rsm.lic $pkgdir/usr/share/licenses/rsm/rsm.lic
    cp $srcdir/rsm.sh $pkgdir/etc/profile.d/rsm.sh
}
