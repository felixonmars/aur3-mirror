pkgname=notification-daemon-engine-coco-git
pkgver=20100307
pkgrel=1
pkgdesc="The Coco (NotifyOSD look-alike) theme engine for the notification daemon"
arch=('i686' 'x86_64')
url="http://github.com/tatofoo/notification-daemon-engine-coco"
license=('GPL3')
depends=('gtk2' 'notification-daemon')
source=()
_gitroot="git://github.com/tatofoo/notification-daemon-engine-coco.git"
_gitname="notification-daemon-engine-coco"

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "$FORCE_VER" ]; then
	msg "Determining latest build revision..."
	FORCE_VER=$(wget -q -O-                                                                   \
	               http://github.com/tatofoo/notification-daemon-engine-coco/commits/master   \
	               | grep '<abbr class="relatize" title='                                     \
	               | head -n1                                                                 \
	               | awk '{print $3;}'                                                        \
	               | sed -e 's/.*"//' -e "s/-//g")
fi

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
	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir" install
}
