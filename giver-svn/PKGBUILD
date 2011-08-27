# Contributor: Josef Lusticky <evramp@gmail.com>

pkgname=giver-svn
pkgver=105
pkgrel=1
pkgdesc="The easiest file sharing app ever written - SVN version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/giver/"
license=('MIT')
depends=('mono' 'perlxml' 'gtk-sharp-2' 'gnome-sharp' 'notify-sharp-svn' 'mono-zeroconf')
makedepends=('subversion' 'gnome-common')
source=(giver-svn.install)
md5sums=('a268cff638476395d77e0761b0431085')

_svntrunk=http://giver.googlecode.com/svn/trunk/
_svnmod=giver-read-only
_options="--prefix=/usr"

build() {
  cd "$srcdir"
  if [ -d "$_svnmod/.svn" ]; then
    cd "$_svnmod" # ^^
    if [ -f "config.status" ]; then
      msg "Cleaning old source.."
      make clean || echo "Don't worry,, All done."
    fi
    msg "Updating giver SVN..."
    svn up -r $pkgver
  else
    msg "Downloading giver SVN..."
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    cd "$_svnmod"
  fi
  msg "SVN checkout done or server timeout"

  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir -p $MONO_SHARED_DIR
  ./autogen.sh $_options || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
