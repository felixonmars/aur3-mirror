# Contributor: Paul Burton <paulburton89@gmail.com>

pkgname=dbus-explorer
pkgver=0.5
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A GTK+ application to display the API of D-Bus services."
url="http://www.ndesk.org/DBusExplorer"
license="MIT"
depends=('ndesk-dbus-glib' 'gtk-sharp-2')
backup=()
source=(http://www.ndesk.org/archive/dbus-explorer/${pkgname}-${pkgver}.tar.gz)
md5sums=('f3fc2bdd3c7460fb074a673e1983d311')

build() {
    export MONO_SHARED_DIR="${srcdir}/.wabi"
    mkdir -p "${MONO_SHARED_DIR}"

    cd $startdir/src/$pkgname-$pkgver

    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir" install || return 1
}
