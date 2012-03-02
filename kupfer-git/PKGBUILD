# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=kupfer
pkgname=$_name-git
pkgver=20120302
pkgrel=1
pkgdesc="An interface for quick and convenient access to applications and their documents"
arch=(any)
url="http://kaizer.se/wiki/kupfer/"
license=('GPL')
depends=('pyxdg' 'pygtk' 'dbus-python' 'python2-gconf' 'python-keybinder'
         'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('gnome-python-desktop: enables all plugins and gnome integration'
            'python-appindicator: ubuntu-style notification icon'
            'python-keyring: gnome keyring integration'
            'python-wnck: tracks running applications'
            'python2-setproctitle: set process name'
            'python-gdata: google services')
makedepends=('git' 'gnome-doc-utils' 'docutils' 'intltool')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"

_gitroot=git://git.gnome.org/$_name
_gitname=$_name

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  # python2 fixes
  export PYTHON=/usr/bin/python2

  python2 waf configure --prefix=/usr \
                        --no-update-mime \
                        --no-update-icon-cache
  python2 waf
} 

package() {
  cd "$srcdir/$_gitname-build"

  python2 waf install -f --destdir="$pkgdir/"
}
