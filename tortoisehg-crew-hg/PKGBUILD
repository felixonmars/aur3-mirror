#Contributor: Yumi Nanako <yumileroy [at] yahoo.com>
pkgname=tortoisehg-crew-hg
pkgver=3215
pkgrel=1
pkgdesc="GUI frontend for mercurial including hgtk and nautilus plugin - TortoiseHG Crew Repository"
arch=(i686 x86_64)
url="http://bitbucket.org/tortoisehg/"
license=('GPL2')
makedepends=('mercurial')
depends=('python-nautilus>=0.5.0-2' 'mercurial' 'python-iniparse')
optdepends=('meld: visual diff tool' 'fldiff: visual diff tool' 'kdiff3: visual diff tool')
provides=('tortoisehg')
conflicts=('tortoisehg' 'tortoisehg-hg' 'tortoisehg-hgtk')
install=tortoisehg-hg.install
source=()
md5sums=()

_hgroot="http://bitbucket.org/tortoisehg/"
_hgrepo="crew" 

build() {
  cd $srcdir

  if [ -d $_hgrepo/.hg ]; then
    (cd $_hgrepo && hg up -r $pkgver)
  else
    hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  
  if [ -d $_hgrepo-build ]; then
    msg "Removing old build directory"
    rm -rf $_hgrepo-build
  fi
  
  msg "Copying repository to another build directory"
  cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build

  cd $srcdir/${_hgrepo-build}

  python setup.py build || return 1
  python setup.py install --root=$startdir/pkg || return 1

}

