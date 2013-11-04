pkgname='python-abx-hg'
pkgver=6.d7be7b4118b3
pkgrel=1
pkgdesc='Rewrite of the abandoned abx-comparator tool in Python/GTK+ (Mercurial)'
url='http://code.google.com/p/python-abx/'
license=('GPL2')
arch=('any')
depends=('python2' 'gstreamer0.10-python' 'pygtk>=2')
makedepends=('mercurial')
optdepends=('gstreamer0.10-plugins: Meta package containing all supported codecs')
provides=('python-abx')
conflicts=('python-abx')
source=('hg+https://code.google.com/p/python-abx/')
md5sums=('SKIP')

pkgver() {
	cd python-abx
	echo "$(hg identify -n).$(hg identify -i)"
}

build() {
        # Create start script
        echo '#!/bin/sh' > python-abx.sh
        echo '(cd /usr/share/python-abx; python2 abx.py $@)' >> python-abx.sh
}

package() {
	# Create directory
	install -d "${pkgdir}/usr/share/python-abx"

	# Copy everything except for .hg dir
	cp -rp python-abx/* "${pkgdir}/usr/share/python-abx/"

	# Install start script
	install -D -m755 python-abx.sh "${pkgdir}/usr/bin/python-abx"
}
