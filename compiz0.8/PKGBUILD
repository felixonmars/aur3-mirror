# Maintainer: X0rg

_realname=compiz
pkgbase=${_realname}0.8
pkgname=("$pkgbase-bcop" "$pkgbase-ccsm" "$pkgbase-compizconfig-python" "$pkgbase-core" "$pkgbase-emerald"
	 "$pkgbase-emerald-themes" "$pkgbase-libcompizconfig" "$pkgbase-plugins-extra" "$pkgbase-plugins-main" "$pkgbase-plugins-unsupported")
pkgver=0.8.10
pkgrel=1
pkgdesc="Composite manager for Aiglx and Xgl, with plugins and CCSM (branch 0.8.x)"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws"
groups=('compiz0.8')
makedepends=('pyrex' 'intltool' 'libice' 'python2' 'gconf' 'xdg-utils' 'desktop-file-utils')
conflicts=('compiz' 'compiz-bzr' 'compiz-manjaro' 'compiz-ubuntu' 'compiz-xfce')
replaces=('compiz' 'compiz-bzr' 'compiz-manjaro' 'compiz-ubuntu' 'compiz-xfce')
source=("http://www.northfield.ws/projects/$_realname/releases/$pkgver/bcop.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/ccsm.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/core.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/compizconfig-python.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/emerald.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/emerald-themes.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/libcompizconfig.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/plugins-extra.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/plugins-main.tar.gz"
	"http://www.northfield.ws/projects/$_realname/releases/$pkgver/plugins-unsupported.tar.gz")
md5sums=('8efcebe07f5c1e7d4365d639e4ebf324'
         'a9b14472e65fe6e9bc37207cb36d993e'
         'a502e17eb7f61c5c66ec889c019a1f62'
         '83040ae44d6c558e02a07ac233424644'
         '17910144838e1d306703c0b34bf807ac'
         '2528df1cbe3e6c147c81823bb9794a78'
         'bce932159ffabb2e60672238d3059f3d'
         '482b776e2cf0b846fee9798c4e164f83'
         '638bafc171d06c27d8d70ea75ba61196'
         'a7391dfbc4f83546e866d84e6457555e')

prepare() {
	cd "$srcdir/ccsm/ccm"
	msg2 "Patch ccsm to use Python2..."
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' *
}

build() {
	export PYTHON=/usr/bin/python2.7


	_components=(bcop compizconfig-python emerald emerald-themes libcompizconfig plugins-extra plugins-main plugins-unsupported)
	for component in "${_components[@]}"; do
		cd "$srcdir/$component"
		msg "Starting build for component $component..."

		msg2 "Running 'autogen.sh' for $component..."
		./autogen.sh --sysconfdir=/etc --prefix=/usr

		msg2 "Running 'configure' for $component..."
		./configure --sysconfdir=/etc --prefix=/usr

		msg2 "Running 'make' for $component..."
		make
	done


	component=ccsm
	cd "$srcdir/$component"
	msg "Starting build for component $component..."

	msg2 "Running 'setup.py' for $component..."
	python2 ./setup.py build --prefix=/usr


	component=core
	cd "$srcdir/$component"
	msg "Starting build for component $component..."

	msg2 "Running 'autogen.sh' for $component..."
	./autogen.sh --sysconfdir=/etc --prefix=/usr --disable-gnome --disable-kde --disable-kde4

	msg2 "Running 'configure' for $component..."
	./configure  --sysconfdir=/etc --prefix=/usr --disable-gnome --disable-kde --disable-kde4

	msg2 "Running 'make' for $component..."
	make
}

package_compiz0.8-bcop() {
	pkgdesc="Compiz option code generator (branch 0.8.x)"
	arch=('any')
	license=('GPL2')
	depends=('bash' 'libxslt')
	conflicts=('compiz-bcop')
	replaces=('compiz-bcop')

	cd "$srcdir/bcop"
	make DESTDIR="$pkgdir" install
}

package_compiz0.8-ccsm() {
	pkgdesc="Compizconfig Settings Manager in Python2 (branch 0.8.x)"
	arch=('any')
	license=('GPL2')
	depends=('python2' 'pygtk' 'libsexy' 'librsvg')
	conflicts=('ccsm')
	replaces=('ccsm')
	install=ccsm.install

	cd "$srcdir/ccsm"
	python2 ./setup.py install --prefix=/usr --root="$pkgdir"
}

package_compiz0.8-compizconfig-python() {
	pkgdesc="Compizconfig bindings for Python (branch 0.8.x)"
	license=('GPL2')
	depends=('compiz0.8-libcompizconfig' 'glib2')
	provides=('compizconfig-python')
	conflicts=('compizconfig-python')
	replaces=('compizconfig-python')

	cd "$srcdir/compizconfig-python"
	make DESTDIR="$pkgdir" install
}

package_compiz0.8-core() {
	pkgdesc="Compiz Core without DE deps (branch 0.8.x)"
	license=('GPL2' 'LGPL2.1' 'custom:MIT')
	depends=('libxcomposite' 'libxext' 'libxfixes' 'libxdamage' 'libxrandr' 'libsm' 'libxml2' 'libxslt' 'startup-notification'
		'libxrender' 'libpng' 'glib2' 'gconf' 'dbus' 'librsvg' 'gtk2' 'libwnck' 'cairo' 'glu' 'fuse')
	conflicts=('compiz-core')
	replaces=('compiz-core')

	cd "$srcdir/core"
	make DESTDIR="$pkgdir" install

	install -Dm644 "./COPYING.MIT" "$pkgdir/usr/share/licenses/compiz0.8-core/COPYING.MIT"
}

package_compiz0.8-emerald() {
	pkgdesc="Emerald window decorator (branch 0.8.x)"
	license=('GPL2')
	depends=('compiz0.8-core' 'libxrender' 'gtk2' 'libwnck' 'cairo' 'desktop-file-utils')
	conflicts=('emerald' 'emerald0.9')
	replaces=('emerald' 'emerald0.9')
	install=emerald.install

	cd "$srcdir/emerald"
	make DESTDIR="$pkgdir" install
}

package_compiz0.8-emerald-themes() {
	pkgver=0.6.99
	pkgdesc="Themes for Emerald (branch 0.8.x)"
	arch=('any')
	license=('GPL2')
	conflicts=('emerald-themes')
	replaces=('emerald-themes')

	cd "$srcdir/emerald-themes"
	make DESTDIR="$pkgdir" install
}

package_compiz0.8-libcompizconfig() {
	pkgdesc="Compiz configuration system library (branch 0.8.x)"
	license=('GPL2' 'LGPL2.1')
	depends=('libx11' 'compiz0.8-core' 'libxml2' 'protobuf')
	conflicts=('libcompizconfig')
	replaces=('libcompizconfig')

	cd "$srcdir/libcompizconfig"
	make DESTDIR="$pkgdir" install
}

package_compiz0.8-plugins-extra() {
	pkgdesc="Compiz Fusion Extra plugins (branch 0.8.x)"
	license=('GPL2')
	depends=('compiz0.8-bcop' 'compiz0.8-core' 'libnotify' 'gtk2' 'glu' 'libxslt')
	conflicts=('compiz-fusion-plugins-extra')
	replaces=('compiz-fusion-plugins-extra')

	cd "$srcdir/plugins-extra"
	make DESTDIR="$pkgdir" install
}

package_compiz0.8-plugins-main() {
	pkgdesc="Compiz Fusion Main plugins (branch 0.8.x)"
	license=('GPL2')
	depends=('compiz0.8-bcop' 'compiz0.8-core' 'libxrender' 'cairo' 'glu' 'libxslt')
	conflicts=('compiz-fusion-plugins-main')
	replaces=('compiz-fusion-plugins-main')

	cd "$srcdir/plugins-main"
	make DESTDIR="$pkgdir" install
}

package_compiz0.8-plugins-unsupported() {
	pkgdesc="Compiz Fusion Unsupported plugins,provide effects like snow and fish (branch 0.8.x)"
	license=('GPL2')
	depends=('compiz0.8-bcop' 'compiz0.8-core' 'libxslt')
	conflicts=('compiz-fusion-plugins-unsupported')
	replaces=('compiz-fusion-plugins-unsupported')

	cd "$srcdir/plugins-unsupported"
	make DESTDIR="$pkgdir" install
}
