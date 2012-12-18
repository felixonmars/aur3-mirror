# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer: SanskritFritz (gmail)

_name=kupfer
pkgname=${_name}-add-git
pkgver=20121218
pkgrel=2
pkgdesc="An interface for quick and convenient access to applications and their documents. Forked by Karol Bedkowski."
arch=(any)
url="https://github.com/KarolBedkowski/kupfer-adds"
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

_gitroot=git://github.com/KarolBedkowski/kupfer-adds.git
_gitname=$_name

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi

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
