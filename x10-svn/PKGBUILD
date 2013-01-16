# Maintainer: TDY <tdy@archlinux.info>

pkgname=x10-svn
pkgver=24832
pkgrel=1
pkgdesc="A new programming language from IBM with a focus on parallel, high-end computing"
arch=('i686' 'x86_64')
url="http://x10-lang.org/"
license=('EPL')
depends=('java-environment')
makedepends=('apache-ant' 'subversion')
provides=('x10')
conflicts=('x10')
options=('!emptydirs' '!strip')
install=x10.install
source=(x10.profile)
md5sums=('40392c992ca5ba3858dd503d529d7124')

_svntrunk=https://x10.svn.sourceforge.net/svnroot/x10/trunk
_svnmod=x10

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
  cd "$srcdir/$_svnmod-build/$_svnmod.dist"

  ant squeakyclean dist \
    -DNO_CHECKS=true \
    -Doptimize=true
}

package() {
  cd "$srcdir/$_svnmod-build/$_svnmod.dist"
  install -dm755 "$pkgdir/opt/x10/bin/"
  cp -a bin etc include lib samples stdlib tools "$pkgdir/opt/x10/"
  install -Dm644 "$srcdir/x10.profile" "$pkgdir/etc/profile.d/x10.sh"
  rm -f "$pkgdir"/opt/x10/bin/*.in

  msg2 "Enforcing permissions..."
  find "$pkgdir/opt/x10/" -type f -exec chmod 644 '{}' \;
  chmod 755 $(find "$pkgdir/opt/x10" -exec file '{}' \;|grep -E 'ELF|directory'|cut -d: -f1)
  chmod 755 "$pkgdir"/opt/x10/bin/*
}

# vim:set ts=2 sw=2 et:
