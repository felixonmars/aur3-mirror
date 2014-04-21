# Contributor: localizator <localizator@ukr.net>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>

# Maintainer: Cedric Ziel <cedric.ziel@gmail.com>

pkgname=seafile3-client
pkgver=3.0.1
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is seafile client for synchronizing your local files with seafile server."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('qt4' 'seafile3-shared>=3.0.1')
makedepends=('cmake')
optdepends=()
options=('!libtool' '!emptydirs')
install=seafile-client.install
source=("https://github.com/haiwen/seafile-client/archive/v${pkgver}-testing.tar.gz")

build ()
{
	cd "$srcdir/seafile-client-${pkgver}-testing"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package ()
{
	cd "${srcdir}/seafile-client-${pkgver}-testing"
	make DESTDIR="${pkgdir}/" install
}
sha256sums=('7f3cda49e5d648a8b857a4737836b4af1a957edacc125d2a6ecf327738498bfe')
