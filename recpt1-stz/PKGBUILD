# Maintainer: acounto <acounto@kamikakushi.net>

pkgname=recpt1-stz
pkgver=5553a7d0
pkgrel=1
pkgdesc="recpt1 modifired by stz2012."
arch=('i686' 'x86_64')
url='https://github.com/stz2012/recpt1/'
license=('unknown')
conflicts=('recpt1')
provides=('recpt1')
depends=('libarib25' 'pcsclite')
makedepends=('git')
optdepends=('pt3-drv: PT3 chardev driver')

_gitroot=https://github.com/stz2012/recpt1.git
_gitname=recpt1
_foldername=recpt1

build() {
	cd "$srcdir"
	msg "Connecting to github..."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "git checkout finished."
	msg "Starting make..."

	cd $_gitname/$_foldername
  chmod u+x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-b25 
  make
}

package() {
  cd "$srcdir/$_gitname/$_foldername"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
