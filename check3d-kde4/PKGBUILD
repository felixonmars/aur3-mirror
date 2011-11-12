# Contributor: yossarianuk <morgancoxuk@gmail.com>
pkgname=check3d-kde4
pkgver=1
pkgrel=1
pkgdesc="Disable 3d effects in Kde4 for fullscreen games/apps"
arch=('i686' 'x86_64')
license=('GPL')
source=(check3d-kde4.sh)
url=https://bbs.archlinux.org/viewtopic.php?id=130203
build() {
echo "installing"
}

package() {
install -D -m775 $srcdir/${_pkg}/check3d-kde4.sh \
                $pkgdir/usr/local/bin/check3d-kde4
}
#post_install () {
#echo "To use type check3d-kde4 [game]"
#"i.e"
#"check3d-kde4 doom3"
#}
md5sums=('9d5985c3cbd54fb39fddc211294edb24')
