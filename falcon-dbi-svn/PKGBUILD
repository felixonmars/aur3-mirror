# Contributor: Abdallah Aly < l3thal8 @gmail.com>
pkgname=falcon-dbi-svn
pkgver=143
pkgrel=1
pkgdesc="the Database Interface module for Falcon proramming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
arch=(i686 x86_64)
makedepends=('cmake' 'subversion')
depends=('falcon')
provides=('falcon-dbi')

_svntrunk=svn://falconpl.org/falcon/modules/dbi/trunk/
_svnmod=dbi

build() {

cd "$srcdir"
if [ -d $_svnmod/.svn ]; then
  (cd $_svnmod && svn up -r $pkgver)
else
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
fi

msg "SVN checkout done or server timeout"
msg "Starting make..."


if [-d "$srcdir/$_svnmod-build" ] ; then 
 rm -rf "$srcdir/$_svnmod-build" || return 1
fi

#cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build" || return 1

mkdir "$srcdir/$_svnmod-build" || return 1
cd "$srcdir/$_svnmod-build" || return 1

cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      "$srcdir/$_svnmod" || return 1
mkdir -p $startdir/pkg/usr/lib/falcon || return 1
make DESTDIR="$startdir/pkg/" install || return 1
mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-dbi || return 1

}
