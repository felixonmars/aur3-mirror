#Contributor <Themaister> <maister@archlinux.us>

pkgname=rsound-git
pkgver=20100821
pkgrel=1
pkgdesc="Simple solution for streaming PCM data from client to server in real time."

url="http://github.com/Themaister/RSound"
arch=('i686' 'x86_64')

license=('GPL')
depends=()
makedepends=(git)
provides=(rsound)
conflicts=(rsound)

source=()
_gitroot="git://github.com/Themaister/RSound.git"
_gitname="RSound"

build() 
{
	cd $srcdir
	msg "Connecting to the GIT server ..."

	git clone $_gitroot

	msg "Git checkout done."
	cd $_gitname
	
	./configure --prefix=/usr	|| return 1
	make || return 1
}

package()
{
	cd $srcdir/$_gitname
   mkdir -p $pkgdir/usr/share/man/man1
	make DESTDIR=${pkgdir} install || return 1
}


