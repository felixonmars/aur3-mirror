# from orginal PKGBUILD
# Maintainer:  Wessel Dirksen "p-we" <wdirksen at gmail dot com>
# Contributor: Guillermo Garcia <ahioros@NO-SPAM.gmail.com>
#
# contributor ringo32 <ringodekroon at NO-SPAM.gmail.com>
pkgname=plymouth-theme-manjaro-glow
pkgver=1
pkgrel=1
pkgdesc="Manjaro rebranded of glow plymouth theme"
url="http://www.manjaro-nl.org"
arch=('any')
license=('GPL')
depends=('plymouth')
install='plymouth-manjaro-glow.install'

source=('plymouth-manjaro-glow.tar.xz' \
        'plymouth-manjaro-glow.install')

md5sums=('69d1bf99a3b4788c128b58c3dfc59b7d'
	 '0b35a4a4c90f321e1767030fc23b69df')

package() {

  cd $srcdir
  find . -type f -exec install -D -m644 {} ${pkgdir}/usr/share/plymouth/themes/{} \;
}
