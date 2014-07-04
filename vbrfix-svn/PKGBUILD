# Contributor: scrawl <scrawl@baseoftrash.de>

pkgname=vbrfix-svn
pkgver=0.33beta
pkgrel=3
pkgdesc="QT / console program useful for fixing corrupt mp3 files"
arch=('i686' 'x86_64')
url="https://gna.org/projects/vbrfix"
license=('GPL2')
depends=('qt4')
makedepends=('subversion')
options=('!makeflags')
source=(svn://svn.gna.org/svn/vbrfix/trunk vbrfix.desktop)
sha1sums=('SKIP'
          '4ddd868214e5b1ae371b8fa5c43e55f272ce2464')

build() {
  cd trunk/vbrfix
  qmake-qt4
  make
}

package() {
  cd trunk/vbrfix
  install -Dm755 QtFixer/VbrfixGui "${pkgdir}/usr/bin/VbrfixGui"
  install -Dm755 ConsoleFixer/VbrfixConsole "${pkgdir}/usr/bin/VbrfixConsole"
  install -Dm644 "${srcdir}/vbrfix.desktop" "${pkgdir}/usr/share/applications/vbrfix.desktop"
}
