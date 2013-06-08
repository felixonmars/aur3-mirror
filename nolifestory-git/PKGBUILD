# Maintainer: angelsl <slepsilon@gmail.com>
pkgname=nolifestory-git
pkgver=fc1f24708a5ec33a83bd5
pkgrel=1
pkgdesc="NoLifeStory client"
arch=('i686' 'x86_64')
url="https://github.com/NoLifeDev/NoLifeStory"
license=('AGPL')
depends=('sfml' 'boost-libs' 'glew' 'mpg123' 'libgl')
makedepends=('boost' 'git' 'cmake')
install='nolifestory.install'
source=('git://github.com/NoLifeDev/NoLifeClient.git'
		'git://github.com/NoLifeDev/NoLifeNx.git'
		'git://github.com/NoLifeDev/NoLifeStory.git'
		'NoLifeStory.desktop')
md5sums=('SKIP' 'SKIP' 'SKIP' '311ca3ae611f1a07aa6e5a58d8eef37f')

pkgver() {
	echo $(git --git-dir=NoLifeClient/.git/ --work-tree=NoLifeClient/ rev-parse --short HEAD)$(git --git-dir=NoLifeNx/.git/ --work-tree=NoLifeNx/ rev-parse --short HEAD)$(git --git-dir=NoLifeStory/.git/ --work-tree=NoLifeStory/ rev-parse --short HEAD)
}

prepare() {
	rm -rf $srcdir/build
}

build() {
	cp NoLifeStory/CMakeLists.txt .
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -G"Unix Makefiles" ..
	make
}

package() {
	mkdir -p $pkgdir/opt/nolifestory-git $pkgdir/usr/share/applications $pkgdir/usr/bin
	ln -s /opt/nolifestory-git/NoLifeClient $pkgdir/usr/bin/NoLifeClient
	cp $srcdir/build/NoLifeClient/NoLifeClient $pkgdir/opt/nolifestory-git
	cp $srcdir/NoLifeStory.desktop $pkgdir/usr/share/applications
}
