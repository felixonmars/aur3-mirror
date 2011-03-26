pkgname=rhythmbox-desktop-art-svn
pkgver=0
pkgrel=6
pkgdesc="This Rhythmbox plugin shows album cover art for the current playing song on the desktop."
url="http://www.nedrebo.org/code/rhythmbox_desktop_art/"
arch=(i686 x86_64 ppc)
license=('GPL')
depends=('rhythmbox')
makedepends=('subversion')
source=()
md5sums=()

build() {
cd $startdir/src

msg "Getting sources..."
svn co http://nedrebo.org/svn/rhythmbox/desktop-art

mkdir -p $startdir/pkg/usr/lib/rhythmbox/plugins/desktop-art
install -m 644 $startdir/src/desktop-art/* $startdir/pkg/usr/lib/rhythmbox/plugins/desktop-art
}