# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=kdenetwork-kaccounts-integration-git
_gitname=kaccounts-integration
pkgver=0.580.49be970
pkgrel=1
pkgdesc="Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, Jabber and others"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/base/kde-accounts/kaccounts-integration"
license=('GPL')
depends=('akonadi-facebook-git' 'kdepim-libkdepim' 'telepathy-kde-contact-list' 'telepathy-logger-qt' 'telepathy-kde-auth-handler' 'libaccounts-qt' 'libsignon-glib')
makedepends=('git' 'cmake' 'automoc4' 'boost')
source=("git://anongit.kde.org/$_gitname")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_gitname"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd "${srcdir}/$_gitname"
  make DESTDIR="$pkgdir" install
}
