# Maintainer: John Regan <john@jrjrtech.com>
pkgname=pam_kwallet-svn
pkgver=1137507
pkgrel=1
pkgdesc="A PAM module to automatically open a user's KWallet on login"
arch=('x86_64' 'i686')
url="http://websvn.kde.org/trunk/playground/base/pam_kwallet/"
license=('GPL')
depends=('pam' 'kdebase-runtime' 'kdeutils-kwalletmanager')
makedepends=('subversion' 'cmake' 'automoc4')
md5sums=() 

_svnmod="pam_kwallet"
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/"${_svnmod}"

pkgver() {
  cd "$srcdir/${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
  install -D lib/pam_kwalletopener.so "${pkgdir}/usr/lib/security/pam_kwalletopener.so"
}

# vim:set ts=2 sw=2 et:
