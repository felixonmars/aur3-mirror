# $Id: PKGBUILD 105936 2014-02-19 15:38:09Z speps $
# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=qupzilla-webengine-git
pkgver=v1.6.3.r7.g72f96d6
pkgrel=1
pkgdesc="Experimental port of the QupZilla browser to QtWebEngine"
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL3')
depends=( 'qt5-script' 'qt5-webengine' 'kdelibs' 'libgnome-keyring' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git')
provides=('qupzilla')
conflicts=('qupzilla' 'qupzilla-qt5')
source=("$pkgname"::'git+http://github.com/jturcotte/qupzilla-qtwebengine.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  export QUPZILLA_PREFIX=/usr/ \
         KDE_INTEGRATION=true \
         GNOME_INTEGRATION=true

  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir/" install

  # zsh completion
  install -Dm644 linux/completion/_qupzilla \
    "$pkgdir/usr/share/zsh/site-functions/_qupzilla"
}