# Maintainer: PrestonM. <pentie at gmail.com>

pkgname=pymunin-git
_pkgname=PyMunin
pkgver=20131204
pkgrel=3
makedepends=('python2' 'git')
pkgdesc="Python Module for developing Munin Multigraph Monitoring Plugins."
arch=("any")
url="http://aouyar.github.com/PyMunin/"
license=('GPL3')
conflicts=('pymunin')
provides=('pymunin')
depends=('python2' 'python2-setuptools' 'munin-node')
install=$pkgname.install
source=()

_gitroot=https://github.com/aouyar/PyMunin.git
_gitname=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}


package() {
  cd "$srcdir/$_gitname-build"
  export MUNIN_PLUGIN_DIR="${pkgdir}/usr/lib/munin/plugins"
  mkdir -p $MUNIN_PLUGIN_DIR
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Ext files
  PYMUNIN_EXT="${pkgdir}/usr/share/pymunin"
  mkdir -p $PYMUNIN_EXT
  cp -rv ext $PYMUNIN_EXT 
}

# vim:set ts=2 sw=2 et:
