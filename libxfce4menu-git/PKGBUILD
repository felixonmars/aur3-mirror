# $Id$
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

pkgname=libxfce4menu-git
pkgver=20100615
pkgrel=1
pkgdesc="A freedesktop.org compliant menu implementation for Xfce."
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-git')
depends=('libxfce4util-git')
makedepends=('git' 'pkgconfig' 'xfce4-dev-tools-git')
conflicts=('libxfce4menu')
replaces=('libxfce4menu')
provides=("libxfce4menu=4.6.1")
options=('!libtool')
source=()
md5sums=()
_gitname="libxfce4menu"
_gitroot="git://git.xfce.org/xfce/libxfce4menu"


build() {
	    cd $srcdir
    msg "Getting sources..."
    
    if [ -d "$srcdir/$_gitname" ] ; then
	 cd $_gitname && git pull origin
	 msg "The local files are updated."
	else
	 git clone $_gitroot
	fi

msg "GIT checkout done or server timeout"
msg "Starting build..."

	cd $srcdir/$_gitname

	
  ./autogen.sh  --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
