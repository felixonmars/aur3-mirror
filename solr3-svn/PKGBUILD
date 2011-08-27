# Maintainer: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=solr3-svn
pkgver=1070243
pkgrel=1
pkgdesc="Future branch of solr search suite"
arch=('any')
url="http://lucene.apache.org/solr/"
license=('APACHE')
depends=('java-environment=6')
makedepends=('subversion'
             'apache-ant')
source=('solr.rc' 'solr.conf')
md5sums=('159e094cc5c6408410c0a1fe06637360'
         '1113e9ee08fb694dcd13eed0d4bce624')

_svntrunk=https://svn.apache.org/repos/asf/lucene/dev/branches/branch_3x/
_svnmod=solr
_DEST="${pkgdir}/usr/share/java/solr"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn export $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  cd solr/
  ant example
}

package() {
  cd "$srcdir/$_svnmod-build/solr"
  mkdir -p $_DEST
  cp -r example/* $_DEST
  mkdir -p $pkgdir/etc/rc.d
  mkdir -p $pkgdir/etc/conf.d
  cp $srcdir/solr.rc $pkgdir/etc/rc.d/solr
  cp $srcdir/solr.conf $pkgdir/etc/conf.d/solr
}
