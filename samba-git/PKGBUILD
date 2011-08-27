pkgname=samba-git
pkgver=3.6.0
pkgrel=1
pkgdesc="Tools to access a server's filespace and printers via SMB"
arch=('i686' 'x86_64')
url="http://www.samba.org/"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=('samba' 'smbclient')
conflicts=('samba' 'smbclient')
source=()
md5sums=()

_gitroot=git://git.samba.org/samba.git
_gitname=samba

build() {
  cd $srcdir
  msg "Connecting git.samba.org server..."

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    cd ..
  else
    git clone $_gitroot
  fi

  cd $_gitname/source3
  ./autogen.sh || return 1
  ./configure --prefix=/usr --enable-fhs || return 1
  #sed s/installmisc\\\\/\\\\/ < Makefile > Makefile.new
  #mv Makefile.new Makefile
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
