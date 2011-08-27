# Maintainer: Patrick Palka <patrick@parcs.ath.cx>
# Development: http://closure.ath.cx/aur-dev

_name=intarray
pkgname="php-$_name"
pkgver=1.0.0
pkgrel=2
pkgdesc="Efficient integral arrays for PHP"
arch=('i686' 'x86_64')
url="http://opensource.dynamoid.com/"
license=('unknown')
depends=('php')
_ininame="$_name.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")
_filename="$_name-$pkgver"
source=("http://opensource.dynamoid.com/$_filename.tar.gz")
md5sums=('07955eb5e89ff0eadd41d988d1fb7d29')
_builddir="$srcdir/$_filename"

build() {
    cd "$_builddir"
    phpize
    ./configure --prefix=/usr --enable-intarray
    make
    #make test
}

package() {
    cd "$_builddir"
    make INSTALL_ROOT="$pkgdir" install
    echo ";extension=$_name.so" > "$_ininame"
    install -vDm644 "$_ininame" "$pkgdir/$_inifile"
    install -vDm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
