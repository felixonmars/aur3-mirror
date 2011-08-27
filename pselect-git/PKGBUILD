pkgname=pselect-git
pkgver=20100321
pkgrel=1
pkgdesc="Pselect is a tool for using packages installed on the same system that have conflicts with each other."
arch=('any')
url="http://github.com/some-guy/pselect"
license=('GPL2')
depends=()
makedepends=('git')
source=()
_gitroot="git://github.com/some-guy/pselect.git"
_gitname="pselect"

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "$FORCE_VER" ]; then
	msg "Determining latest build revision..."
	FORCE_VER=$(wget -q -O- http://github.com/some-guy/pselect/commits/master                 \
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
	install -m755 -d ${pkgdir}/usr/bin
	install -m755 -d ${pkgdir}/usr/share/pselect
	install -m755 -d ${pkgdir}/var/lib/pselect
	sed s:@prefix@:/usr: pselect.in >pselect
	install -m755 pselect ${pkgdir}/usr/bin/
}
