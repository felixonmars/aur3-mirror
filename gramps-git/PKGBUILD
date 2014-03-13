# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=gramps-git
#_svnname=gramps
pkgver=23476 
pkgrel=1
pkgdesc="Genealogical Research Software"
arch=('any')
url="http://gramps-project.org/"
license=('GPL')
provides=('gramps')
conflicts=('gramps')
depends=('python-bsddb' 'python-gobject' 'desktop-file-utils' 'shared-mime-info' 'gtk3' 'librsvg' 'xdg-utils')
# optdepends partially copied from https://www.archlinux.org/packages/community/any/gramps/
optdepends=('graphviz: enable creation of graphs (required for trree reports'
				'gtkspell3: enable spell checking in notes'
				'libgexiv2: manage Exif metadata embedded in your media'
				'python-pillow: crop and convert images to JPG'
				'rcs: manage multiple revisions of your family trees'
				'ttf-freefont: more font support in the reports'
				'python-osmgpsmap: Geographie functionality')
makedepends=('python')
source=("svn+https://svn.code.sf.net/p/gramps/code/trunk")
sha256sums=('SKIP')
install=gramps.install

pkgver() {
	cd ${srcdir}/trunk
	local ver="$(svnversion)"
	printf "%s" "${ver//[[:alpha:]]}"
}

build() {
	msg "Building..."
	cd ${srcdir}/trunk
	python setup.py build
   #python setup.py install --root ${srcdir}/build
}

package() {
	msg "Installing package..."
	cd ${srcdir}/trunk
	python setup.py install --root ${pkgdir}
	#cp -dr --preserve=mode,timestamp ${srcdir}/build/usr ${pkgdir}/usr
	
	# workaround to fix wrong resource path (couldn't figure out a way to do this via parameters upon installation)
	echo -n /usr/share > ${pkgdir}/usr/lib/python3.3/site-packages/gramps/gen/utils/resource-path
}

