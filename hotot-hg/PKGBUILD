# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Tayhe <admin at tayhe dot com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_pkg=hotot
pkgname=$_pkg-hg
pkgver=955
pkgrel=1
pkgdesc="A lightweight & open source microblogging client"
arch=('any')
url="http://www.hotot.org/"
license=('LGPL3')
depends=('desktop-file-utils' 'python-distutils-extra'
         'python-notify' 'python-keybinder' 'pywebkitgtk')
makedepends=('mercurial')
provides=("$_pkg")
conflicts=("$_pkg")
install="$pkgname.install"

_hgroot="https://bitbucket.org/shellex"
_hgrepo="$_pkg"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone --insecure $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  # remove google analytics tracking code
  sed -i '/\/\/ 6. run track code/,+4d' data/index.html

  # pytho2 fix
  sed -i "s|\(bin/python\).*|\12|;s|\(env python\).*|\12|" \
    `grep -Erl "(bin/python|env python)" .`

  python2 setup.py build
}

package() {
  cd "$srcdir/$_hgrepo-build"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
