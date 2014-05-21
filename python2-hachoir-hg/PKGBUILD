# Maintainer: felix <at yandex dot com, local part 'isaev' preceded by m dot p dot>
pkgname=python2-hachoir-hg
true && pkgname=(
	python2-hachoir-core-hg
##	python2-hachoir-http-hg
	python2-hachoir-metadata-hg
	python2-hachoir-parser-hg
	python2-hachoir-regex-hg
	python2-hachoir-subfile-hg
	python2-hachoir-urwid-hg
	python2-hachoir-wx-hg
)
pkgver=1.3.3+6c5223145c56
pkgrel=1
pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- library and utilities (split package)"
arch=(any)
url="https://bitbucket.org/haypo/hachoir/wiki/Home"
license=('GPL')
groups=()
depends=(python2)
makedepends=(mercurial)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(hg+https://bitbucket.org/haypo/hachoir)
noextract=()
md5sums=(SKIP) #generate with 'makepkg -g'

_HAVE_QT4=1

pkgver() {
	cd "$srcdir/hachoir"
	hg parents --template '{latesttag}' | sed -e 's/:.*//'
	printf '+'
	hg identify -i
}

prepare() {
	cd "$srcdir/hachoir"

	sed -i -e 's/"pyuic4"/"python2-pyuic4"/' hachoir-metadata/setup.py

	msg2 "Fixing shebangs..."
	find -path '*/.hg' -prune -o -type f -exec sed -i -e '1 s,^\(#!.*\)python$,\1python2,' '{}' \;
}

for _pkg in "${pkgname[@]}"; do
	if [[ "$_pkg" = *hachoir-metadata* ]]; then
		[[ -n "$_HAVE_QT4" ]] && makedepends+=(python2-pyqt4)
	fi
done

build() {
	cd "$srcdir/hachoir"
	for _pkg in "${pkgname[@]}"; do
		msg2 "Building $_pkg"

		_pkg="${_pkg%-hg}"
		_pkg="${_pkg#python2-}"

		cd "$srcdir/hachoir/$_pkg"

		if [[ "$_pkg" = hachoir-parser ]]; then
			python2 README.py
		elif [[ "$_pkg" = hachoir-metadata ]]; then
			python2 setup.py build "${_HAVE_QT4:+--disable-qt}"
			continue
		fi

		[[ -r setup.py ]] && python2 setup.py build
	done
}

_install() {
	cd "$srcdir/hachoir/$1"
	python2 setup.py install --root "$pkgdir"
}

package_python2-hachoir-core-hg() {
	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- core library"

	_install hachoir-core
}

# package_python2-hachoir-gtk-hg() {
# 	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- GTK+ sample application"
# 	true && depends+=(python2-hachoir-core-hg)
# 
# 	cd "$srcdir/hachoir/hachoir-gtk"
# 	install -D -m0755 hachoir-gtk "$pkgdir/usr/bin/hachoir-gtk"
# }

#package_python2-hachoir-http-hg() {
#	: # XXX: https://wiki.archlinux.org/index.php/Web_Application_Package_Guidelines
#}

package_python2-hachoir-metadata-hg() {
	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- metadata extractor"
	true && depends+=(python2-hachoir-parser-hg)
	[[ -n "$_HAVE_QT4" ]] && depends+=(python2-pyqt4)

	_install hachoir-metadata
}

package_python2-hachoir-parser-hg() {
	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- parser library"
	true && depends+=(python2-hachoir-core-hg)

	_install hachoir-parser
}

package_python2-hachoir-regex-hg() {
	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- regex library"

	_install hachoir-regex
}

package_python2-hachoir-subfile-hg() {
	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- subfile library"
	true && depends+=(python2-hachoir-parser-hg python2-hachoir-regex-hg)

	_install hachoir-subfile
}

package_python2-hachoir-urwid-hg() {
	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- terminal frontend"
	true && depends+=(python2-hachoir-parser-hg)

	_install hachoir-urwid
}

package_python2-hachoir-wx-hg() {
	true && pkgdesc="Python library used to represent of a binary file as a tree of Python objects -- wxWidgets frontend"
	true && depends+=(python2-hachoir-parser-hg wxpython)

	_install hachoir-wx
}

# vim:set ts=2 sw=2 et:
