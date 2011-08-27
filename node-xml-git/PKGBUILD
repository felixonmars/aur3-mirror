# Packager: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
pkgname=node-xml-git
pkgver=20100618
pkgrel=1
pkgdesc='An xml parser for node.js written in javascript'
arch=('i686' 'x86_64')
provides=('node-xml')
conflicts=('node-xml')
url='http://github.com/robrighter/node-xml'
license='MIT'
depends=('nodejs')
makedepends=('git')

_gitroot="git://github.com/robrighter/node-xml.git"
_gitname="node-xml"

build() {
	cd $srcdir

	msg "Connecting to GIT server..."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
		cd $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting install..."

	mkdir -p $pkgdir/usr/lib/node/
	install -Dm0644 lib/*.js $pkgdir/usr/lib/node/

	sed -i 's,"./lib/node-xml","node-xml",' example.js
	install -Dm0644 example.js $pkgdir/usr/share/$_gitname/example.js

	install -Dm0644 README.md $pkgdir/usr/share/doc/$_gitname/README.md
}

