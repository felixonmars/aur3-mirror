# Maintainer: xduugu
pkgname=mucommander-svn
_pkgname=${pkgname%-*}
pkgver=3473
pkgrel=1
pkgdesc="A lightweight, cross-platform, two-panel file manager"
arch=('any')
url="http://www.mucommander.com/"
license=('GPL3')
depends=('java-runtime' 'x-server')
makedepends=('apache-ant>=1.6.5' 'subversion')
provides=("mucommander=$pkgver")
conflicts=('mucommander')
replaces=('mucommander')
source=($_pkgname.desktop $_pkgname.svg)
md5sums=('e97214428370b5ad7776975cf06b1778'
         '89f47ca8a0d05345db657ef7f33cc323')
sha256sums=('8fff093ea741d2e2549379f63bd6cf0fc4ff877aa3640fd0c4fb4ca5c46f58fe'
            '205aceb54ef67679dbf827a728729a0522eb6f8a5046e779b8efaa8eaf73e937')

_svntrunk=https://svn.mucommander.com/mucommander/trunk/
_svnmod=mucommander

build() {
  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  source /etc/profile.d/apache-ant.sh || return 1

  ant tgz &&
  cd dist &&
  bsdtar xf "$_pkgname"*.tar.gz &&
  cd "${_pkgname/c/C}-"* &&
  sed -i 's@MUCOMMANDER_JAR=$CURRENT_DIR/mucommander.jar@MUCOMMANDER_JAR=/usr/share/java/mucommander/mucommander.jar@' "$_pkgname.sh" &&
  install -Dm755 "$_pkgname.sh"              "$pkgdir/usr/bin/$_pkgname" &&
  install -Dm644 "$_pkgname.jar"             "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar" &&
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop" &&
  install -Dm644 "$srcdir/$_pkgname.svg"     "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg" || return 1
}

# vim:set ts=2 sw=2 et:
