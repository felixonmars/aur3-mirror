# Contributor: Jan Jezek <honzin.jezek@gmail.com>

pkgname=parole-media-player-git
pkgver=20100615
pkgrel=1
pkgdesc="Parole is a modern simple media player based on the GStreamer framework for the Xfce desktop."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/parole"
license=('GPL')
depends=('gtk2>=2.16' 'glib2>=2.16' 'dbus>=0.60' 'dbus-glib>=0.70' 'libxfcegui4>=4.6.0' 'libxfce4util>=4.6.0' 'exo-git' 'libnotify' 'gstreamer0.10' 'gstreamer0.10-base'  'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig' 'git' 'xfce4-dev-tools-git')
provides=('parole-media-player')
conflicts=('parole-media-player')
source=()
md5sums=()


_gitroot="git://git.xfce.org/apps/parole"
_gitname="parole"

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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
