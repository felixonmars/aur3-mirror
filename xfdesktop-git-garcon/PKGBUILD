# Contributor: Silvio Knizek <killermoehre@gmx.net>

pkgname=xfdesktop-git-garcon
pkgver=20100801
pkgrel=2
pkgdesc="A desktop manager for Xfce - port to garcon"
arch=(i686 x86_64)
license=('GPL2')
url="http://git.xfce.org/xfce/xfdesktop"
depends=('garcon-git' 'exo-git' 'thunar-git' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'pkgconfig' 'xfce4-dev-tools')
provides=(xfdesktop)
options=('!libtool')
install=${pkgname}.install
source=()
md5sums=()

_gitroot=git://git.xfce.org/xfce/xfdesktop
_gitname=xfdesktop
_gitbranch=jannis/port-to-garcon

build() {
    
    cd $srcdir
    msg "Getting sources..."
    
    if [ -d "$srcdir/$_gitname" ] ; then
	 cd $_gitname && git pull origin
	 msg "The local files are updated."
	else
	 git clone $_gitroot -b $_gitbranch
	fi

msg "GIT checkout done or server timeout"
msg "Starting build..."

	cd $srcdir/$_gitname

    msg "Starting build..."
	
  ./autogen.sh \
  --prefix=/usr \
  --sysconfdir=/etc \
  --libexecdir=/usr/lib \
  --localstatedir=/var \
  --disable-static \
  --enable-nls \
  --enable-desktop-icons \
  --enable-file-icons \
  --enable-thunarx \
  --enable-exo \
  --enable-desktop-menu \
  --disable-desktop-menu-dir \
  || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
