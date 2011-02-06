#Contributor: Mineo <the_mineo at web dot de>

pkgname=gedit-classbrowser-git
provides=gedit-classbrowser
conflicts=('gedit-classbrowser')
pkgver=20100305
pkgrel=1
pkgdesc="development version of gedit-classbrowser"
url="http://github.com/FooBarWidget/gedit-class-browser-plugin"
license="GPLv2+"
arch=('i686' 'x86_64')
depends=('gedit')
makedepends=('git')

_gedit_dir="${pkgdir}/usr/lib/gedit-2/"
_gedit_plugins_dir="${_gedit_dir}/plugins/"

_gitroot="git://github.com/FooBarWidget/gedit-class-browser-plugin.git"
_gitname="gedit-class-browser-plugin"

build() {
	cd $startdir/src
	msg "Connecting to $_gitroot server..."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "Git checkout done or server timeout"
	msg "Copying files..."

	cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
	cd $startdir/src/$_gitname-build

    mkdir -p $_gedit_plugins_dir
    cp -r classbrowser classbrowser.gedit-plugin $_gedit_plugins_dir || return 1
}

