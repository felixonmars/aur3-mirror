# Maintainer: spider-mario <spidermario@free.fr>
pkgname=krazy-git
pkgver=2.1009.gb7c7638
epoch=1
pkgrel=1
pkgdesc="Scans C++ code looking for issues."
arch=('i686' 'x86_64')
url="http://ebn.kde.org/krazy/"
license=('GPL')
depends=('qt4' 'perl-xml-libxml' 'perl-yaml' 'perl-tie-ixhash' 'perl-html-parser')
makedepends=('git' 'inetutils')
provides=('krazy')
conflicts=('krazy2')
options=('!emptydirs')
source=('git://gitorious.org/krazy/krazy.git')
sha512sums=('SKIP')

pkgver() {
  cd krazy

  git tag --message 'krazy2' --force 2 bcbef2e53e1c945b84b432167398650f5af8605d
  git describe | tr - .
}

package() {
  cd krazy

  export QMAKE=qmake-qt4

  ./install.sh "$pkgdir"/usr # let’s just begin with the helper script.

  rm -r "$pkgdir"/usr/conf/ # not needed and in a non-standard directory.
}

# vim:set ts=2 sw=2 et:
