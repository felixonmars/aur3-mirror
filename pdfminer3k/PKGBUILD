# Maintainer: Blake Dickie <gentro_silva@shaw.ca>
pkgname=pdfminer3k
pkgver=1.2.4
pkgrel=1
pkgdesc="PDF Parsing Library"
arch=(any)
url="http://hg.hardcoded.net/pdfminer3k"
license=('GPL')
depends=('python' 'python-distribute' 'python-ply')
makedepends=('mercurial')
source=()
md5sums=()


build() {

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$pkgname" ]]; then
    cd "$pkgname"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "https://bitbucket.org/hsoft/pdfminer3k" "$pkgname"
  fi

  msg "Mercurial checkout done or server timeout"
  
  msg "Preparing Working Build Folder"
  rm -rf "$srcdir/$pkgname-build"
  cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"
  
  msg "Switching to Production Tag"
  hg checkout $pkgver
  
  msg "Starting build..."

  python setup.py build
  
}

package() {
  cd "$srcdir/$pkgname-build"
  
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
