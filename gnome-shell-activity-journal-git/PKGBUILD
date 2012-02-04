# Maintainter: Ahmed M. Abdellah <a3dman1@gmail.com>
pkgname=gnome-shell-activity-journal-git
pkgver=20110622
pkgrel=1
pkgdesc="Zeitgeist based activity history journal"
arch=('any')
url="https://github.com/kitallis/gnome-shell-activity-journal"
license=('GPL3')
depends=('gnome-shell' 'zeitgeist')
makedepends=('git')

_gitroot="git://github.com/kitallis/gnome-shell-activity-journal.git"
_gitname="gnome-shell-activity-journal"

build() {
	cd ${srcdir}
	msg "Connecting to the GIT server..."
	if [[ -d ${srcdir}/${_gitname} ]] ; then
		cd ${_gitname}
		git pull origin
		msg "The local files are updated..."
	else
		git clone ${_gitroot} ${gitname}
		cd ${_gitname}
	fi
	msg "GIT checkout done."
}

package() {
	cd "$srcdir/${_gitname}"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
	cp -R "activity-journal@gnome-shell-extensions.gnome.org" "$pkgdir/usr/share/gnome-shell/extensions"
}
