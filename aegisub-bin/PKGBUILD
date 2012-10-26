# Maintainer: Kozec <kozec at kozec dot com>

pkgname=aegisub-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (unofficial pre-compiled binaries)"
arch=('i686' 'x86_64')
url="http://www.aegisub.net/"

license=('GPL' 'BSD')
provides=('aegisub')
conflicts=('aegisub' 'aegisub-svn' 'aegisub-stable-svn')
source=("http://dl.dropbox.com/u/134520/aegisub-precompiled-${pkgver}.tar.gz")
install=aegisub.install

# Dependencies converted from 'Building Aegisub 2.1.9 on Ubuntu' thread,
# http://forum.aegisub.org/viewtopic.php?f=10&t=4686
depends=('fontconfig>=2.4.2' 'lua>=5.1' 'hunspell'
    'wxgtk2.9' 'libass>=0.10' 'ffmpegsource>=2.16'
    'fftw' 'desktop-file-utils' 'hicolor-icon-theme'
    )
# excluded dep: openal 


build() {
	true
}

package() {
	cd "$srcdir/"
	mkdir -p $pkgdir/usr/bin
	cp -R "share" $pkgdir/usr
	cp bin/aegisub-3.0-${CARCH} $pkgdir/usr/bin/aegisub-3.0
	ln -s aegisub-3.0 $pkgdir/usr/bin/aegisub
}

md5sums=('873b93fc2963c1bdf76b1d27daa5b23b')
