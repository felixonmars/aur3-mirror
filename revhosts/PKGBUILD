# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>
pkgname=revhosts
pkgver=2.0
pkgrel=1
pkgdesc="A complex and complete network monitoring tool"
arch=('i686' 'x86_64')
url="http://www.revhosts.org/"
license=('GPL')
depends=('python' 'pygobject' 'pygtk')
provides=(revhosts)
conflicts=(revhosts)
install=
source=(http://www.revhosts.org/wiki/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('2d6f645c160a37152eb2fbe6a3712477')

build() {
  mkdir -p ${startdir}/pkg/usr/share
  mkdir -p ${startdir}/pkg/usr/bin
  cp -a ${startdir}/src/${pkgname} ${startdir}/pkg/usr/share/${pkgname}
  ln -s /usr/share/${pkgname}/${pkgname} ${startdir}/pkg/usr/bin/${pkgname}
  msg "revhosts avaiable on '/usr/share/revhosts' and linked as '/usr/bin/revhosts'"
}
