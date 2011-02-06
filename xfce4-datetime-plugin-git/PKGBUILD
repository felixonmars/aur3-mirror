# $Id$
# Contributor: M.H. Trinh <mhtrin@gmail.com>

pkgname=xfce4-datetime-plugin-git
pkgver=20110103
pkgrel=1
pkgdesc="A date and time display plugin for the Xfce panel"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('')
depends=('xfce4-panel-devel>=4.6.1')
makedepends=('wget' 'patch' 'git' 'pkgconfig' 'xfce4-dev-tools-devel' 'xfce4-panel-devel>=4.6.1')
conflicts=('xfce4-datetime-plugin')
provides=("xfce4-datetime-plugin=0.6.1")
md5sums=()

_gitroot="git://git.xfce.org/panel-plugins/xfce4-datetime-plugin"
_gitname="xfce4-datetime-plugin"
_patch="http://bugzilla.xfce.org/attachment.cgi?id=2980"

build() {
    
    cd $srcdir
    msg "Getting sources..."
    
    if [ -d "$srcdir/$_gitname" ] ; then
       rm -rf $_gitname
       fi
    git clone $_gitroot

msg "GIT checkout done or server timeout"
msg "Getting patch ..."
    wget $_patch -O panel-4.7.patch || return 1

msg "Applying patch ..."	

	cd $srcdir/$_gitname
	
	patch -Np1 -i ../panel-4.7.patch || return 1 
	
msg "Starting build..."
	
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
