# Contributor: Ian Haywood <ihaywood@gnu.org>
# Maintainer: Ian Haywood <ihaywood@gnu.org>
pkgname=easygp-server
pkgver=152
pkgrel=1
pkgdesc="Server package for the EasyGP medical record program"
arch=(i686 x86_64)
url="http://ozdocit.org/easygp/"
license=('GPL')
groups=()
depends=(postgresql)
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=svn://ozdocit.org/easygp/trunk/

build() {
  cd "$srcdir"

  if [ -d trunk/.svn ]; then
    (cd trunk && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/build"
  cp -r "$srcdir/trunk" "$srcdir/build"
  cd "$srcdir/build"

  #
  # BUILD
  #
  # actually all we do have is copy a few files
  
  install -d $pkgdir/usr/share/easygp/
  install -m 444 db/easygp.schema.sql $pkgdir/usr/share/easygp/
  install -m 444 db/easygp.data.sql $pkgdir/usr/share/easygp/
  # FIXME: install upgrade scripts too
}
