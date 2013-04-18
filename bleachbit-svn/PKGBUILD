# Maintainer: Ner0
# Contributor: Wido <widomaker2k7 at gmail dot com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=bleachbit-svn
pkgver=2892
pkgrel=1
pkgdesc="Deletes unneeded files to free disk space and maintain privacy"
arch=('any')
url="http://bleachbit.sourceforge.net/"
license=('GPL3')
depends=('pygtk' 'python2' 'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme')
optdepends=('gksu')
install=bleachbit.install
provides=('bleachbit')
conflicts=('bleachbit')
makedepends=('subversion')
source=('bleachbit::svn://svn.code.sf.net/p/bleachbit/code/trunk'
        'bleachbit-admin.desktop'
        'bleachbit-admin.png')
md5sums=('SKIP'
         'e98a9102ea459571b677f88225d9e9c6'
         'ddd834baa40d481a603333638e735825')

pkgver() {
  cd "$SRCDEST/bleachbit"
  svnversion
}

prepare() {
  cd "$srcdir/bleachbit"
  sed -i '/\/usr.*python$/s/$/2/' $(grep -Rl "/usr/bin.*python$" .)
  sed -i 's/python/python2/g;/^tests:/Q' Makefile
}

package() {
  cd "$srcdir/bleachbit"
  make PYTHON=python2 prefix=/usr DESTDIR="$pkgdir/" install

  install -Dm644 "$srcdir/bleachbit-admin.png" "$pkgdir/usr/share/pixmaps/bleachbit-admin.png"
  install -Dm644 "$srcdir/bleachbit-admin.desktop" "$pkgdir/usr/share/applications/bleachbit-admin.desktop"
}
