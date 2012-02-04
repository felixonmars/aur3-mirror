# Contributor: scippio <scippio@berounet.cz>

pkgname=librouteros-git
pkgver=20100312
pkgrel=1
pkgdesc="is a C library to communicate with network device by MikroTik running their Linux-based operating system RouterOS"
arch=(i686)
url="http://www.verplant.org/librouteros/"
license=('GPL')
depends=('libgcrypt')
makedepends=('gcc' 'make')
conflicts=('librouteros')
replaces=('librouteros')

_gitroot="git://git.verplant.org/routeros-api.git"
_gitname="routeros-api"

build() {
  cd ${srcdir}
  #/$pkgname-$pkgver
  msg "Connecting to GIT server..."
  
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_gitname}
  rm -rf autom4te.cache

  libtoolize --force && aclocal $ACLOCAL_FLAGS && autoheader && automake --include-deps --add-missing --foreign && autoconf || return 1
  
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install
}
