# $Id$
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>

_pkgname=thunar-media-tags-plugin
pkgname=${_pkgname}-git
pkgver=20100723
pkgrel=2
pkgdesc="create and deflate archives in thunar"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org"
groups=('xfce4-git')
depends=('thunar-git' 'taglib')
makedepends=('git' 'intltool' 'pkgconfig' 'xfce4-dev-tools-git')
provides=("${_pkgname}")
options=('!libtool')
md5sums=()


_gitroot="git://git.xfce.org/thunar-plugins/$_pkgname"
_gitname="$_pkgname"
_gitbranch="thunarx-2"

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
    

	cd $srcdir/$_pkgname
    
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib  \
    --localstatedir=/var --disable-static  --enable-debug=minimum \
   --enable-maintainer-mode || return 1

  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
