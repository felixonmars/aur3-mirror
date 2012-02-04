# $Id$
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

pkgname=libxfcegui4-git
pkgver=20110524
pkgrel=1
pkgdesc="Various gtk widgets for Xfce."
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-git')
depends=('startup-notification' 'xfconf>=4.6.1' 'libglade>=2.6.4' 'hicolor-icon-theme')
makedepends=('git' 'pkgconfig' 'xfce4-dev-tools-git')
conflicts=('libxfcegui4')
replaces=('libxfcegui4')
provides=("libxfcegui4=4.6.1")
options=('!libtool')
source=()
md5sums=()

_gitroot="git://git.xfce.org/xfce/libxfcegui4"
_gitname="libxfcegui4"

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
	
  ./autogen.sh 
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib\
    --localstatedir=/var --disable-static --enable-maintainer-mode
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
