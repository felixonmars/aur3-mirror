# Maintainer: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
# Contributor: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
pkgname=valaterm-gtk3
pkgver=0.5.1
pkgrel=1
pkgdesc="ValaTerm is a lightweight terminal written in Vala with Gtk3"
arch=('i686' 'x86_64')
url="http://git-jpdeplaix.dyndns.org/valaterm/"
license=('GPL3')
depends=('vte3>=0.26')
makedepends=('vala>=0.13.2' 'gcc' 'intltool' 'gettext' 'python')
conflicts=('valaterm')
source=(http://git-jpdeplaix.dyndns.org/valaterm/valaterm.git/snapshot/valaterm-$pkgver.tar.bz2)
sha512sums=('a32bf49471301666358c6682130337711b2465545fb84b03e6e03eedfff18498bb2c9bde5868730e3aaff2a2b115620edae7b0b27e4be3497a13ba861123a24a')

build()
{
	cd "$srcdir/valaterm-$pkgver"

	./waf configure --with-gtk3 --prefix=/usr || return 1
	./waf build || return 1
}

package ()
{
	cd "$srcdir/valaterm-$pkgver"

	./waf install --destdir=$pkgdir || return 1
}
