# Maintainer: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
# Contributor: Jacques-Pascal Deplaix <jp.deplaix@gmail.com>
pkgname=valaterm
pkgver=0.6
pkgrel=1
pkgdesc="ValaTerm is a lightweight terminal written in Vala"
arch=('i686' 'x86_64')
url="http://git-jpdeplaix.dyndns.org/valaterm/"
license=('GPL3')
depends=('vte3>=0.28')
makedepends=('vala>=0.13.2' 'gcc' 'intltool' 'gettext' 'python')
conflicts=('valaterm-gtk2')
replaces=('valaterm-gtk3')
source=(https://bitbucket.org/deplai_j/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
sha512sums=('2d4352c9ed4af90c02f5ddeeadcb4c37303688aac8cf7fca12a97b6adedbfe95875aaefd5c48d10113992185f0066c36b60a6b9158aaf097dea8bfda39b8baeb')

build()
{
	cd "$srcdir/$pkgname-$pkgver"

	./waf configure --prefix=/usr || return 1
	./waf build || return 1
}

package ()
{
	cd "$srcdir/$pkgname-$pkgver"

	./waf install --destdir=$pkgdir || return 1
}
