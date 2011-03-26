_pkgname=u8it
pkgname=$_pkgname-git
pkgver=20100323
pkgrel=1
pkgdesc="u8it is used for Wii development to unpack .arc files."
url="http://github.com/icefire/$_pkgname/tree"
license="GPL"
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'gcc')
provides=($_pkgname)

_gitroot="git://github.com/icefire/$_pkgname.git"
_gitname=$_pkgname

build() {
    cd "$srcdir"

    msg "Connecting to github.com GIT server...."

    if [ -d $srcdir/$_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot
	cd $_gitname
    fi

    gcc $_pkgname.c -o u8it

    mkdir -p $pkgdir/usr/bin
    cp u8it $pkgdir/usr/bin
}
