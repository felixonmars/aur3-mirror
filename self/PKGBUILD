# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: http://parcs.ath.cx:99/pub/patrick/to.php?self

pkgname=self
pkgver=4.4
pkgrel=3
pkgdesc="a prototype-based dynamic object-oriented programming language"
url="http://selflanguage.org/"
arch=('i686' 'x86_64')
license=('BSD')
source=("http://selflanguage.org/files/releases/4.4/Self-${pkgver}.tar.gz"
        "http://selflanguage.org/files/releases/4.4/Clean-4.4.snap"
        "http://selflanguage.org/files/releases/4.4/Demo-4.4.snap")
md5sums=('9d7afe2c0b44c8fb9a8016ae1786cb34'
         'ed7bea51882d92eba65cf37501ad4eef'
         '160ab5fd1ea37918bdf677b71e9edb9e')
if [ "$CARCH" = "x86_64" ]; then
    depends=(lib32-libx11 lib32-gcc-libs)
else
    depends=(libx11)
fi

package() {
    cd "$srcdir/Self-${pkgver}"
    install -Dm755 Self "${pkgdir}/usr/share/self/0/Self"
    cd ..
    for snapshot in Clean* Demo*; do
      install -m644 "${snapshot}" "${pkgdir}/usr/share/self/0"
    done
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/self/0/Self" "${pkgdir}/usr/bin"
}
