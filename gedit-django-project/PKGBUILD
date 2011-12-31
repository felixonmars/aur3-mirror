# Maintainer: Shanto

pkgname=gedit-django-project
pkgver=3.0.0
pkgrel=2
holdver=$pkgver
pkgdesc="Manage Django projects from Gedit"
arch=('any')
url="https://github.com/Quixotix/gedit-django-project"
license=('LGPL')
depends=('gedit>=3' 'vte3' 'python2')
makedepends=('git')

gitroot=https://github.com/Quixotix/gedit-django-project.git
gitbranch=master
gitname=$pkgname

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$gitname" ]]; then
		cd "$gitname" && git pull origin $gitbranch
		msg "The local files are updated."
	else
		git clone "$gitroot" "$gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$gitname-build"
	cp -r "$srcdir/$gitname" "$srcdir/$gitname-build"
}

package() {
	cd "$srcdir/$gitname-build"
	find . -name '*.py' -exec sed -i 's|#!/usr/bin/env python|#!/usr/bin/python2|' "{}" \;
	mkdir -p $pkgdir/usr/lib/gedit/plugins/
	cp -r djangoproject.plugin djangoproject $pkgdir/usr/lib/gedit/plugins/
	rm -rf "$srcdir/$gitname-build"
}
