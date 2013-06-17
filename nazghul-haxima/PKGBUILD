# Contributor: Xavier de Labouret <arch@2-lab.net>
# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Pio <xpio at tesla.rcub.bg.ac dot rs>

pkgname=nazghul-haxima
pkgver=0.7.0
pkgrel=3
pkgdesc="A computer role-playing game, similar to Ultima IV and V, on top of a generic engine, nazghul"
arch=('i686')
#currently down: url="http://myweb.cableone.net/gmcnutt/nazghul.html"
url="http://sourceforge.net/projects/nazghul"
license="GPL"
depends=('sdl' 'sdl_image' 'sdl_mixer')
replaces=('nazghul')
conflicts=('nazghul')
backup=()
source=(http://downloads.sourceforge.net/sourceforge/nazghul/nazghul-${pkgver}.tar.gz)
md5sums=('3a3b08ee180163030bc9934d6fb40de8')


build() {
	cd "$srcdir/nazghul-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc LIBS=-lpng
	make || return 1
}

package() {
	cd "$srcdir/nazghul-${pkgver}"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/pixmaps/"
	install -D -m644 icons/haxima.png "$pkgdir/usr/share/pixmaps/"
	install -D -m644 haxima.desktop "$pkgdir/usr/share/applications/haxima.desktop"
	cd "$pkgdir/usr/bin"
	ln -s haxima.sh haxima
}
