# Package build for the linux oDesk Team client
# Maintainer: der_FeniX <derfenix dot gmail.com>
# Contributor: Stephen Weinberg <[firstname]@q5comm.com>

_curarch=`uname -m`
if [[ $_curarch == 'x86_64' ]]
then
    _curarch='x86_64'
else
    _curarch='i586'
fi

pkgname=godesk
pkgver=3.2.59
pkgrel=5
pkgdesc="The oDesk Team client for odesk.com"
arch=('i686' 'x86_64')
url="http://www.odesk.com/downloads"
license=('custom:ODESK TEAM LICENSE AGREEMENT')
install=godesk.install
source=("https://www.odesk.com/downloads/linux/odeskteam-$pkgver-opensuse_12.1.$_curarch.rpm"
        "godesk.desktop")
makedepends=('pkgextract')

if [[ $_curarch == 'x86_64' ]]
then
    md5sums=('230c5fa714c9b16bfac794b1468fdfec'
             'd5d155a48fb90db78096e1f74a618e78')
else
    md5sums=('a616c0ba2ab8ff149b89d5e70860eadc'
             'd5d155a48fb90db78096e1f74a618e78')

fi


build() {
    pkgextract.sh odeskteam-$pkgver-opensuse_12.1.$_curarch.rpm
}

package() {
    cd $srcdir
    mkdir $pkgdir/usr
    cp -R $srcdir/usr/* $pkgdir/usr/
    # Move licence to licences dir
    mkdir -p $pkgdir/usr/share/licenses/godesk
    mv "$srcdir/usr/share/doc/packages/odeskteam/COPYING" "$pkgdir/usr/share/licenses/godesk/COPYING"

    # Install .desktop file
    install -D -m 644 "$srcdir/godesk.desktop" "$pkgdir/usr/share/applications/godesk.desktop"
}
