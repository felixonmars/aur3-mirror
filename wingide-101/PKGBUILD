# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=wingide-101
pkgver=5.1.1
pkgrel=1
_pkgrel=1
_pkgarch="x86_64"
pkgdesc="Wing IDE 101 is free scaled down Python IDE designed for teaching introductory programming classes."
url="http://www.wingware.com"
license=('custom')
arch=('i686' 'x86_64')
source=("http://wingware.com/pub/$pkgname/$pkgver/$pkgname-$pkgver-$_pkgrel-x86_64-linux.tar.gz")
depends=('hicolor-icon-theme' 'libpng12' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
sha1sums=('d7eda65efbe9aa86d634fb55b0ca2c0b6d8bff57')
install=${pkgname}.install

if [ "$CARCH" == "i686" ]; then
    _pkgarch="i386"
    sha1sums[0]='6881b707ac54015eabad6e9241d22df57c1fc873'
    source[0]="http://wingware.com/pub/$pkgname/$pkgver/$pkgname-$pkgver-$_pkgrel-i386-linux.tar.gz"
fi

prepare() {
    cd "$srcdir/$pkgname-$pkgver-$_pkgrel-$_pkgarch-linux"
    sed -i 's/python/python2/' wing-install.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver-$_pkgrel-$_pkgarch-linux"
    ./wing-install.py \
        --install-binary \
        --winghome "${pkgdir}/opt/${pkgname}" \
        --bin-dir ${pkgdir}/usr/bin > /dev/null 2>&1

    # Correct the WINGHOME environment variable
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wingdbstub.py
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wing-101

    # Correct ARCH environment variable
    sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/wingide-101/run-wing.sh
    # Fix a bug in the script
    sed -i "s|'x86_64'\]|'x86_64' \]|" ${pkgdir}/opt/wingide-101/run-wing.sh

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod +x ${pkgdir}/opt/${pkgname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
