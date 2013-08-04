# Maintainer:  Ivan de Jesús Pompa García <ivan.jpg@yandex.com>
# Many thanks to Federico Cinelli, I based this script on his 4pane-svn

pkgname=4pane-git
pkgver=20130803
pkgrel=1
pkgdesc="A multi-pane, detailed-list file manager. New git branch."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk')
makedepends=('git')
source=('4Pane.desktop' 'fix-term-orig.patch')
md5sums=('b3bafbcc64bde3e3742f994574da5fdd' 'd042c1df36eb1cef8f783e5153b9aeed')
conflicts=('4pane' '4pane-svn')
provides=('4pane')

_giturl='git://git.code.sf.net/p/fourpane/git4pane fourpane-git4pane'
_gitdir='fourpane-git4pane'

build() {
  msg 'Cloning GIT repository...'
  cd ${srcdir}
  if [ -d ${_gitdir}/.git ]; then
    (cd ${_gitdir} && git pull origin)
  else
    (git clone ${_giturl})
  fi
  msg 'GIT repository downloaded...'
  msg 'Configuring...'

  cd ${_gitdir}
  ./configure --prefix=/usr --enable-symlink=no --enable-desktop=no

  msg 'Patching Makefile...'
  cp ${startdir}/fix-term-orig.patch ${srcdir}/${_gitdir}
  cd ${srcdir}/${_gitdir}
  patch -Np1 < fix-term-orig.patch

  msg 'Compiling...'
  make -e CXX="g++ `pkg-config --cflags glib-2.0 gtk+-2.0`" \
    -e LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro `pkg-config --libs glib-2.0 gtk+-2.0`"
}

package() {
  cd ${srcdir}/${_gitdir}
  make DESTDIR=${pkgdir} install

  install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps}
  install -D -m644 ${srcdir}/4Pane.desktop ${pkgdir}/usr/share/applications/
  ln -s ${srcdir}/${_gitdir}/bitmaps/4PaneIcon48.png ${pkgdir}/usr/share/pixmaps/4Pane.png
}
