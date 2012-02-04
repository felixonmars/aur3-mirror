pkgname=libnotify-hack
pkgver=20100725
pkgrel=1
pkgdesc="Desktop notification library - hacked for better using with notification-daemon-engine-coco"
arch=(i686 x86_64)
license=('LGPL')
depends=('dbus-glib>=0.80' 'gtk2')
makedepends=('pkgconfig' 'git')
url="http://github.com/tatofoo/libnotify-hack"
options=('!libtool')
replaces=('libnotify')
conflicts=('libnotify')
provides=('libnotify=0.4.5')

source=()
_gitroot="http://github.com/tatofoo/libnotify-hack.git"
_gitname="libnotify-hack"


build() {
  	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${_gitname}

	./autogen.sh

  ./configure --prefix=/usr --disable-static || return 1
  mv README.mkd README
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
