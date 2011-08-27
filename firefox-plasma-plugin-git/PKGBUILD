# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=firefox-plasma-plugin-git
pkgver=20090919
pkgrel=1
pkgdesc="Netscape-compatible browser plugin which runs Plasma applets"
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/plasmaplugin.git"
license=('unknown')

depends=('kdelibs' 'kdebase-plasma')
makedepends=('cmake' 'automoc4')
provides=('firefox-plasma-plugin')
conflicts=('firefox-plasma-plugin')

install=firefox-plasma-plugin.install

_gitroot="git://repo.or.cz/plasmaplugin.git"
_gitname=plasmaplugin

build() {
	msg "Performing source checkout..."
	if [ -d "$_gitname" ]; then
		cd "$_gitname"
		git pull origin || return 1
		cd ..
	else
		git clone "$_gitroot" "$_gitname" || return 1
	fi
	msg "Source checkout finished."
	rm -rf "$_gitname-build"
	git clone "$_gitname" "$_gitname-build" || return 1

	cd "$_gitname-build"
	# Make install to /usr/ as opposed to the user's directory.
	# Give me a shout if this can be done more elegantly.
	sed -i 's#set(MOZPLUGIN_INSTALL_DIR $ENV{HOME}/.mozilla/plugins) \
	         #set(MOZPLUGIN_INSTALL_DIR /usr/lib/mozilla/plugins)#' CMakeLists.txt || return 1

	cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
	make || return 1
	make DESTDIR="$pkgdir" install || return 1

	install -Dm755 examples/plasma.html \
	               "$pkgdir/usr/share/firefox-plasma-plugin/plasma_example.html" || return 1
}
