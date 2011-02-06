# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=adesklet-desknotes
pkgver=0.0.2
pkgrel=3
pkgdesc="Post-It! notes for your desktop"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/desknotes/config.txt')
source=(http://downloads.sourceforge.net/adesklets/desknotes-$pkgver.tar.bz2)
md5sums=('560dbd85398cd8104629c1fffe11401f')

build() {
  cd ${srcdir}/desknotes-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' desknotes.py

  install -d ${pkgdir}/usr/share/adesklets/desknotes
  install -m664 -g adesklets CHANGELOG COPYING GNUmakefile README \
    ${pkgdir}/usr/share/adesklets/desknotes
  install -m775 -g adesklets desknotes.py \
    ${pkgdir}/usr/share/adesklets/desknotes
}
