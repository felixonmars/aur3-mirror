# Contributor: adriano <adriano.src@gmail.com>

_pkgname=pydingo
pkgname=pydingo-svn
pkgver=44
pkgrel=2
pkgdesc="A multi purpose application (file manager, text editor, other) based on PyQt4."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pydingo/"
license=('GPL')
depends=('python2-pyqt4' 'python2-qscintilla' 'pyxdg')
provides=('pydingo')
makedepends=('subversion')
optdepends=('hachoir: recommended. It is on AUR'
'gnome-vfs-python: GNOME/Other application suggesting for files')
source=($_pkgname::svn+http://pydingo.googlecode.com/svn/trunk/
	pydingo-run)
md5sums=('SKIP'
         '9941f7e38e0475b67488c1f045874dbe')


pkgver() {
  cd $SRCDEST/$_pkgname
  svnversion | tr -d [A-z]
}

package() {
  cd $_pkgname

  install -d $pkgdir/usr/lib/$_pkgname
  cp -R * $pkgdir/usr/lib/$_pkgname
  install -Dm 755 $srcdir/pydingo-run $pkgdir/usr/bin/pydingo
}
