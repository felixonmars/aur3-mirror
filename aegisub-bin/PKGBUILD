# Maintainer: Kozec <kozec at kozec dot com>

pkgname=aegisub-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (unofficial pre-compiled binaries)"
arch=('i686' 'x86_64')
url="http://www.aegisub.net/"

license=('GPL' 'BSD')
provides=('aegisub')
conflicts=('aegisub' 'aegisub-svn' 'aegisub-stable-svn')
source=("http://dl.dropbox.com/u/134520/aegisub-precompiled-${pkgver}.tar.gz")

# Dependencies converted from 'Building Aegisub 2.1.9 on Ubuntu' thread,
# http://forum.aegisub.org/viewtopic.php?f=10&t=4686
depends=('fontconfig>=2.4.2' 'mesa' 'glib2' 'lua>=5.1' 'hunspell'
    'libpulse' 'wxgtk2.9' 'libass>=0.10' 'ffmpegsource>=2.16')
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

md5sums=('6fa92ca21af42c850966667389c7380c')
