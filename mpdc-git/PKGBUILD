# Maintainer: Mathieu Pasquet <packages@mathieui.net>
# Contributor: Mathieu Pasquet <packages@mathieui.net>

pkgname=mpdc-git
pkgver=20121126
pkgrel=2
pkgdesc="A music client for MPD aimed at helping you to feed and manipulate your playlist with great flexibility"
arch=('any')
url="http://nhrx.org/mpdc/"
license=('MIT')
depends=('python' 'mpc' 'zenity' 'python-mpd2' 'python-ply')
makedepends=('git')

source=("git://github.com/nhrx/mpdc.git")
md5sums=("SKIP")

build() {
    cd "$srcdir/mpdc"
    python setup.py install --root=$pkgdir/ --optimize=1
}
