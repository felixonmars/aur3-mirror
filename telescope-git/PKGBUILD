# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Adam Dunlap <dunlapadam@gmail.com>
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
_pkgname=telescope
pkgname=telescope-git
pkgver=7.ad59c3d
pkgrel=1
pkgdesc="A simple window/task switcher"
arch=('i686' 'x86_64')
url="https://bitbucket.org/IlyaSkriblovsky/telescope"
license=('GPL')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'imlib2' 'libxft' 'dbus' 'glib')
makedepends=('git')
provides=('telescope')
conflicts=('telescope')
backup=('etc/telescope.conf' 'etc/telescope.keys')
source=('git://github.com/AdamCDunlap/telescope.git')
md5sums=('SKIP')

pkgver() {
cd "$srcdir"/"$_pkgname"
echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
cd "$srcdir"/"$_pkgname"
make
}

package() {
cd "$srcdir/$_pkgname"
make DESTDIR="$pkgdir/" install
}
