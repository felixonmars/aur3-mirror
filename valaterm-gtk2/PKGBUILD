# Maintainer: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
# Contributor: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
pkgname=valaterm-gtk2
pkgver=0.6
pkgrel=1
pkgdesc="ValaTerm is a lightweight terminal written in Vala with GTK+ 2"
arch=('i686' 'x86_64')
url="http://git-jpdeplaix.dyndns.org/valaterm/"
license=('GPL3')
depends=('vte>=0.28')
makedepends=('vala>=0.12.1' 'gcc' 'intltool' 'gettext' 'python')
conflicts=('valaterm-gtk3' 'valaterm>=0.6')
replaces=('valaterm<0.6')
source=(http://git-jpdeplaix.dyndns.org/valaterm/valaterm.git/snapshot/valaterm-$pkgver.tar.bz2)
sha512sums=('6413a1ad443d210fbb1ea1bf2b270093f881bcdc34189f43282b5a47dba309b1ab0aa4c1dbafae2e1e0d38e741acc12fe0ca952ef034db214ed976e19657b19f')

build()
{
	cd "$srcdir/valaterm-$pkgver"

	./waf configure --with-gtk2 --prefix=/usr || return 1
	./waf build || return 1
}

package ()
{
	cd "$srcdir/valaterm-$pkgver"

	./waf install --destdir=$pkgdir || return 1
}
