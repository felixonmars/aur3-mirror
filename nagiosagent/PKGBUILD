

# Contributor: Eugene Nelen <eugene@nelen.org.ua>
pkgname=nagiosagent
pkgver=1.2.0.1
pkgrel=1
pkgdesc="GUI Agent for Nagios"
arch=(i686)
url="http://netpatch.ru/nagiosagent.html"
license=('GPL')
groups=()
depends=('qt3' 'nas')
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://netpatch.ru/projects/nagiosagent/NagiosAgent-$pkgver-src.zip)
noextract=()
md5sums=('c7182d5736d0259db20db90155149375') #generate with 'makepkg -g'
build() {
  cd "$srcdir/NagiosAgent-$pkgver-src"
  qmake DESTDIR="$pkgdir/usr/bin" ./NagiosAgent.pro
  make   || return 1
 
}

# vim:set ts=2 sw=2 et:
