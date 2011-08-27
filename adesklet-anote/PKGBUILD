# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=adesklet-anote
pkgver=0.1.0
pkgrel=2
pkgdesc="Desklet providing post-it like notes, simply click the note and start typing"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/anote/config.txt')
source=(http://downloads.sourceforge.net/adesklets/anote-$pkgver.tar.bz2)
md5sums=('0e86aad37727474b4dfc448347cd02c2')

package() {
  cd ${srcdir}/anote-$pkgver

#Python2 fix
  sed -i 's_python_python2_' anote-0.1.0.py InputGetter.py

  install -d ${pkgdir}/usr/share/adesklets/anote

  install -m664 README postit.png \
    ${pkgdir}/usr/share/adesklets/anote
  install -m775 anote-$pkgver.py InputGetter.py \
    ${pkgdir}/usr/share/adesklets/anote
  chown -R :adesklets ${pkgdir}/usr/share/adesklets/anote
}
