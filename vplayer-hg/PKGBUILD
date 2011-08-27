# Contributor: Aleksey Frolov <aleks.lifey@gmail.com>

pkgname=vplayer-hg
pkgver=281
pkgrel=1
pkgdesc="Music player aiming to be small and fast. Latest developing version from mercurial repository."
arch=(i686 x86_64)
url=('http://bitbucket.org/A2K/vplayer')
license="GPL"
depends=('python' 'pyqt' 'qt' 'python-xlib' 'python-chardet' 'mutagen')
makedepends=('mercurial')
source=()
md5sums=()
conflicts=('vplayer')
provides=('vplayer')

_hgroot=http://bitbucket.org/A2K
_hgrepo=vplayer

build(){
	cd $startdir/src

	if [ -d $_hgrepo ]; then
		cd $startdir/src/$_hgrepo
		hg pull -u
	else
		hg clone $_hgroot/$_hgrepo || return 1
		cd $startdir/src/$_hgrepo
	fi

	cp -rf $startdir/src/$_hgrepo $startdir/src/$_hgrepo-build
	cd $startdir/src/$_hgrepo-build

	make uis || return 1 
	make resources || return 1
	make translations || return 1

	python setup.py install --root=$startdir/pkg/ || return 1

	install -Dm755 vplayer $startdir/pkg/usr/bin/vplayer
	install -Dm644 vplayer.desktop $startdir/pkg/usr/share/applications/vplayer.desktop
	install -Dm644 icon.svg $startdir/pkg/usr/share/pixmaps/vplayer.svg
	install -Dm644 icon.xpm $startdir/pkg/usr/share/pixmaps/vplayer.xpm
	install -Dm644 icon.png $startdir/pkg/usr/share/pixmaps/vplayer.png

	rm -rf $startdir/src/$_hgrepo-build
}

