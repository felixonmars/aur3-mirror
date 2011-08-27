# Contributor: Jackson Alley <jacksonalley@gmail.com>
pkgname=talika-svn
pkgver=24
pkgrel=1
pkgdesc="GNOME panel applet to switch between open windows using icons."
arch=(any)
url="http://sourceforge.net/projects/talika/"
license=('GPL2')
groups=()
depends=('gnome-panel' 'libwnck')
makedepends=('intltool' 'libwnck' 'subversion')
optdepends=()
provides=('talika')
conflicts=('talika')
replaces=()
backup=()
options=()
install=
noextract=()
md5sums=() #generate with 'makepkg -g'
_svntrunk=https://talika.svn.sourceforge.net/svnroot/talika
_svnmod=talika

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver && cd ..)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout, updating build dir"

  cp -urT $_svnmod/ $_svnmod-build

  cd $_svnmod-build/trunk

  ./autogen.sh --prefix=/usr                                                               
  make || return 1                                                                        
  make DESTDIR="$pkgdir/" install
}

