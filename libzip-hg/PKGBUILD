# Contributor: Abdallah Aly <l3thal8 @gmail. com>

pkgname=libzip-hg
pkgver=1250
pkgrel=1
pkgdesc="libzip is a C library for reading, creating, and modifying zip archives"
arch=(i686 x86_64)
url="http://nih.at/libzip"
license=('GPL')
groups=()
depends=('zlib')
makedepends=('mercurial' 'cmake')
provides=(libzip)
conflicts=(libzip)
md5sums=() #generate with 'makepkg -g'
options=(!libtool)
_hgroot='http://hg.nih.at/'
_hgrepo='libzip'

build() {
cd "$srcdir/libzip"


# update the repo, else clone a new one
	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi

#  export CMAKE_PREFIX_PATH=/usr
  cmake . \
  -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
#  mv $pkgdir/usr/local/* $pkgdir/usr/
}

