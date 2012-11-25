# Maintainer: H.Gökhan Sarı <me@th0th.me>
pkgname=metusuite-git
pkgver=20121119
pkgrel=1
pkgdesc="METU Suite"
arch=('any')
url="https://github.com/th0th/metusuite"
license=('GPL')
depends=('python2')
makedepends=('python2' 'git')
source=('metusuite.desktop')
md5sums=('638901b93b517a549ed0c7d51b99b720')

_gitroot=https://github.com/th0th/metusuite
_gitname=metusuite

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
  cd "$srcdir/$_gitname"

  git checkout experimental

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  
  # desktop files and other stuff
  mkdir -p "$pkgdir"/usr/share/{pixmaps,applications}
  
  cp "$srcdir/metusuite/metusuite_libs/images/logo.png" "$pkgdir/usr/share/pixmaps/metusuite.png"
  cp "$srcdir/metusuite.desktop" "$pkgdir/usr/share/applications/metusuite.desktop"
}

# vim:set ts=2 sw=2 et:
