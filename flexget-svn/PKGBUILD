# Contributor : Chris Baker <baker.chris.3@gmail.com>
pkgname=flexget-svn
pkgver=3142
pkgrel=2
pkgdesc="Multipurpose automation tool for content like torrents, nzbs, podcasts, comics, etc"
arch=('any')
url="http://flexget.com/"
depends=( \
  "python2-feedparser" \
  "python2-sqlalchemy" \
  "python2-yaml" \
  "python2-beautifulsoup4" \
  "python2-html5lib" \
  "python2-pynzb" \
  "python2-jinja" \
  "python2-dateutil" \
  "python2-requests")
makedepends=('subversion')
provides=('flexget')
conflicts=('flexget')
license=('MIT')
source=(flexget)

_svntrunk=http://svn.flexget.com/trunk
_svnmod=trunk

build() {

  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  python2 -c "import compileall; compileall.compile_dir(\".\", force=1)"
}

package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  cd "$srcdir/$_svnmod-build"
  cp -R flexget $pkgdir/usr/lib/python2.7/site-packages/
  install -D -m755 $srcdir/flexget $pkgdir/usr/bin/flexget
  cd $pkgdir/usr/lib/python2.7/site-packages/
  rm -rf `find . -type d -name .svn`

}

sha1sums=('4569edae3c493df01a5006933942bbb3a09c94a9')
