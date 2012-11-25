# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=landslide-git
pkgver=20121108
pkgrel=1
pkgdesc="Generate html5 slideshow from Markdown or reStructuredText sources"
arch=(any)
url="http://github.com/adamzap/landslide"
license=('Apache License')
depends=('python2' 'python2-pygments' 'python2-markdown' 'python2-jinja' 'python2-docutils')
makedepends=('python2-distribute')
optdepends=('princexml')
conflicts=(landslide)
source=()

_gitroot=git://github.com/adamzap/landslide.git
_gitname=landslide
_builddir=$srcdir/$_gitname-build

build() {
  cd $srcdir/
  msg "Connecting to github.com GIT server...."
  if [ -d $srcdir/$_gitname ] ; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  rm -rf $_gitname-build
  
  git clone $_gitname $_gitname-build
  cd $_builddir

  python2 setup.py build
}

package() {
    cd $_builddir
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    find "$pkgdir/" -name '*.pyc' -delete
    find "$pkgdir/" -type d -empty -delete
}
