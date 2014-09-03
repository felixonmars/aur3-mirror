# Maintainer: Erik Beran
pkgname=openhexagon-git
pkgver=1449
pkgrel=1
epoch=
pkgdesc="Open source clone of the hit game Hexagon (git version)"
arch=('i686' 'x86_64')
url="http://vittorioromeo.info/projects.html"
license=('custom:AFL')
groups=()
depends=('sfml' 'lua' 'zlib' 'openal')
makedepends=('git' 'cmake' 'sfml' 'lua' 'zlib' 'openal')
checkdepends=()
optdepends=()
provides=('openhexagon')
conflicts=('openhexagon')
replaces=()
backup=()
options=()
install=
changelog=
_reponame=SSVOpenHexagon
_installpath='opt/openhexagon'
source=("git://github.com/SuperV1234/${_reponame}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  git rev-list --count HEAD
}

prepare() {
	cd "$srcdir/$_reponame"
	git submodule init
	git submodule update
}

build() {
	# create output directory for build, and step into it
	mkdir "$srcdir/$_reponame"/build
	cd "$srcdir/$_reponame"/build
	# generate make files
	cmake -G "Unix Makefiles" ../
	# build
	make
	cd $srcdir/$_reponame
	# download non-tracked assets
	yes | ./wget-assets.sh _RELEASE
}

package() {
	# make filesystem install path
	install -d "$pkgdir/$_installpath"
	install -Dm644 "$srcdir/$_reponame/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# copy executable
	cp "$srcdir/$_reponame/build/SSVOpenHexagon" "$pkgdir/$_installpath"
	# copy tracked content
	cp -r "$srcdir/$_reponame"/_RELEASE/* "$pkgdir/$_installpath"
	# add required (empty) directory
	install -dm777 "$pkgdir/$_installpath"/Profiles
	#install -d "$pkgdir"/usr/bin
	#ln -s "$pkgdir/$_installpath/SSVOpenHexagon" "$pkgdir/usr/bin/openhexagon"
}

