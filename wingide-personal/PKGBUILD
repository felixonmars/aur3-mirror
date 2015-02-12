# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=wingide-personal
pkgver=5.1.1
pkgrel=1
_pkgrel=1
_pkgarch="x86_64"
pkgdesc="Wing IDE Personal is a low-cost Python IDE designed for students and hobbyists."
url="http://www.wingware.com"
license=('custom')
arch=('i686' 'x86_64')
source=("http://wingware.com/pub/$pkgname/$pkgver/$pkgname-$pkgver-$_pkgrel-x86_64-linux.tar.gz")
depends=('hicolor-icon-theme' 'libpng12' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
sha1sums=('03fd1dc3def38c564933dd32ff426509df20aec1')
install=${pkgname}.install

if [ "$CARCH" == "i686" ]; then
    _pkgarch="i386"
    sha1sums[0]='3660be73b639d460f45b3387fe330849eae5d891'
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
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wing-personal

    # Correct ARCH environment variable
    sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/wingide-personal/run-wing.sh
    # Fix a bug in the script
    sed -i "s|'x86_64'\]|'x86_64' \]|" ${pkgdir}/opt/wingide-personal/run-wing.sh

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod +x ${pkgdir}/opt/${pkgname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
