# Maintainer: Pavlo Ilin <ilin.pa@gmail.com>
pkgname=bltool-svn
pkgver=7
pkgrel=1
pkgdesc="Utility to control your display backlight"
arch=('any')
url="https://code.google.com/p/bltool/"
license=('GPL3')
groups=()
depends=('bash>=4.0.0')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='bltool.install'
source=("https://bltool.googlecode.com/files/backlight-permissions.rules")
noextract=()
md5sums=('430e1c00d1bad876c4fc71d9cec60185') 

_svntrunk=http://bltool.googlecode.com/svn/trunk/
_svnmod=bltool

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #

}

package() {
  install -Dm644 backlight-permissions.rules "$pkgdir/etc/udev/rules.d/10-backlight-permissions.rules"

  cd "$srcdir/$_svnmod-build"
  install -Dm755 bltool "$pkgdir/usr/bin/bltool"
}

# vim:set ts=2 sw=2 et:
