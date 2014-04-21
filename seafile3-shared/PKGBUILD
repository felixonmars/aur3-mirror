# Contributor: Moritz Maxeiner <moritz@ucworks.org>

# Maintainer: Cedric Ziel <cedric.ziel@gmail.com>

pkgname=seafile3-shared
pkgver=3.0.1
pkgrel=1
pkgdesc="Shared components of seafile: seafile-daemon, libseafile, libseafile python bindings, manuals, and icons"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/seafile/"
license=('GPL')
depends=('ccnet>=1.4.0' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'fuse')
makedepends=('vala' 'intltool')
optdepends=()
options=('!libtool' '!emptydirs')
install=seafile-shared.install
source=("https://github.com/haiwen/seafile/archive/v${pkgver}-testing.tar.gz"
        "0002-Add-autoconfiguration-for-libjansson.patch")

prepare () {
        cd "$srcdir/seafile-${pkgver}-testing"
        #patch -p1 -i $srcdir/0002-Add-autoconfiguration-for-libjansson.patch
}


build ()
{
	cd "$srcdir/seafile-${pkgver}-testing"
	./autogen.sh
	./configure --disable-server --disable-console --prefix=/usr PYTHON=/usr/bin/python2
	make -j1
}

package ()
{
	cd "${srcdir}/seafile-${pkgver}-testing"
	make DESTDIR="${pkgdir}/" install

	# Remove seafile binary
	rm -rf "${pkgdir}/usr/bin/seafile"
	# Remove cli client binary
	rm -rf "${pkgdir}/usr/bin/seaf-cli"

	install -D -m644 ${srcdir}/seafile-${pkgver}-testing/LICENCE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.txt
}
sha256sums=('cf430fa84ec2185f18e563199fb56705aaeb23df60d709f6df1fca2d3f94eb4f'
            '55d7812bf962743a151f9d0ffe870061e098307311e707afe1f9ceb8aab6865e')
