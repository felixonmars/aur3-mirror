# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname='poomf.sh'
pkgver='r50.6ed2db3'
pkgrel=1
url="https://github.com/JSchilli1/poomf.sh"
pkgdesc='command-line uploader for pomf.se and uguu.se'
arch=('any')
license=('GPL')
depends=('curl' 'libnotify' 'maim' 'slop' 'xclip' 'xorg-xprop')
makedepends=('git')
source=("$pkgname::git+https://github.com/JSchilli1/poomf.sh.git")
md5sums=('SKIP')
pkgver() {
    cd $srcdir/poomf.sh/
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	mkdir -p $pkgdir/usr/local/bin
	install $srcdir/poomf.sh/poomf.sh $pkgdir/usr/local/bin/poomf -m 755 || return 1
}
