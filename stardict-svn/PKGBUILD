# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=stardict-svn
pkgver=594
pkgrel=1
pkgdesc="A powerful international dictionary written in Gtk2."
arch=('i686' 'x86_64')
license=('GPL')
depends=('espeak' 'libsigc++' 'enchant' 'gtk2' 'libsm')
makedepends=('subversion' 'popt' 'intltool' 'gnome-common' 'gnome-doc-utils')
url="http://sourceforge.net/projects/stardict/"
provides=('stardict')
conflicts=('stardict')
options=('!libtool' '!emptydirs')

_svntrunk="https://stardict.svn.sourceforge.net/svnroot/stardict/trunk"
_svnmod="stardict"

build() {
  cd $srcdir
  msg "Updating SVN entries for $_svnmod ..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "Finished update, starting build ..."
  cp -r $_svnmod $_svnmod-build

  cd $_svnmod-build
    
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --disable-gnome-support \
    --disable-schemas-install \
    --disable-festival \
    --disable-qqwry \
    --disable-updateinfo \
    --disable-gucharmap \
    --disable-static \
    --disable-wordnet \
    --disable-tools

  make
  make DESTDIR=$pkgdir install

  rm -rf $srcdir/$_svnmod-build
}
