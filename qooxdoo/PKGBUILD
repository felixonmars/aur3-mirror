# Contributor: thoughtcrime

pkgname=qooxdoo
pkgver=1.0
pkgrel=1
pkgdesc="A framework for creating rich internet applications (RIAs)"
arch=(i686 x86_64) #python
url="http://qooxdoo.org/"
license=('LGPL' 'EGPL')
groups=()
depends=(python)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/qooxdoo/$pkgname-$pkgver-sdk.zip qd.sh)
noextract=()
md5sums=('1176bf4dd5e4ed96b4007f283caa6af3'
         'de653d221f600f79667fbe9be5871ef4')

# remove the ones you do not want to build
# (apiviewer and showcase are already prebuilt)
_demoapps=('demobrowser' 'playground' 'feedreader' 'portal')
_devapps=('testrunner' 'inspector')

build() {
	
	demodir="$pkgdir/usr/share/qooxdoo/application"
	devdir="$pkgdir/usr/share/qooxdoo/component"
	
	demolist="${_demoapps[@]}"
	devlist="${_devapps[@]}"
	
	# copy files to /usr/share
	install -d "$pkgdir/usr/share/"
	cp -r  "$srcdir/$pkgname-$pkgver-sdk" "$pkgdir/usr/share/qooxdoo"
	
	# copy the launch script to /usr/bin
	install -d "$pkgdir/usr/bin/"
	cp "$srcdir/qd.sh" "$pkgdir/usr/bin/qd"
	
	# short overview what we will do
	msg "Here's a list of what will be compiled:"
	msg " examples: $demolist"
	msg " developer applications: $devlist"
	msg "Edit the PKGBUILD if you don't want all of them."
	
	# build examples
	for app in ${_demoapps[@]}; do
		msg "building '$app' example..."
		cd "$demodir/$app"
		./generate.py build
	done
	
	# build developer tools
	for app in ${_devapps[@]}; do
		msg "building '$app' developer tool..."
		cd "$devdir/$app"
		./generate.py build
	done
}

# vim:set ts=2 sw=2 et:
