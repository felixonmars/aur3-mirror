# $Id$
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>

_pkgname=thunar-actions-plugin
pkgname=${_pkgname}-realgit
pkgver=20100411
pkgrel=1
pkgdesc="Thunar contestual menu plugin… real GIT-Snapshot, not from BerliOS.de"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org"
groups=('xfce4-git')
depends=('thunar-git')
makedepends=('git' 'intltool' 'pkgconfig' 'xfce4-dev-tools-git')
provides=("${_pkgname}")
options=('!libtool')
md5sums=()


_gitroot="git://git.xfce.org/thunar-plugins/$_pkgname"
_gitname="$_pkgname"

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
    

	cd $srcdir/$_pkgname
    
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib  \
    --localstatedir=/var --disable-static  --enable-debug=minimum \
   --enable-maintainer-mode || return 1

  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
