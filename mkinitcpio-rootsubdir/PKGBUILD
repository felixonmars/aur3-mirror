# Maintainer: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
# 
# Derived from: https://bbs.archlinux.org/viewtopic.php?pid=932362#p932362
#

pkgname='mkinitcpio-rootsubdir'
pkgver=0.1
pkgrel=2
pkgdesc='hook to set root at a subdirectory of the filesystem'
url='https://github.com/raedwulf/aur/'
arch=('any')
license=('BSD')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0')
source=('rootsubdir_hook' 'rootsubdir_install')

package() {
    install -o root -g root -D ${srcdir}/rootsubdir_install ${pkgdir}/usr/lib/initcpio/install/rootsubdir
    install -o root -g root -D ${srcdir}/rootsubdir_hook ${pkgdir}/usr/lib/initcpio/hooks/rootsubdir
}

md5sums=('7d454ae0c3cb2a022dcfb9da1c766e1c'
         '087acf077385c5b5abacf9ed1c13969b')
