# Contributor: graysky <graysky AT archlinux dot us>
# Contributor: some-guy94

pkgname=torrent-search-svn
pkgver=211
pkgrel=1
pkgdesc="Looks for torrent files on different websites, and allows the user to filter the results, making it very easy to find the torrent you want."
arch=('any')
url="http://torrent-search.sourceforge.net/"
license=('GPL')
depends=('python2' 'gettext' 'pygtk' 'python-lxml' 'python2-httplib2' 'dbus-python')
makedepends=('gettext' 'wget' 'subversion')
conflicts=('torrent-search')
md5sums=()

_svnmod=torrent-search
_svntrunk=https://${_svnmod}.svn.sourceforge.net/svnroot/${_svnmod}

build()
{

cd ${srcdir}

msg "Connecting to ${_svnmod} SVN server...."

if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

msg "SVN checkout done or server timeout"
msg "Starting make..."

[ -d ${srcdir}/${_svnmod}-build ] && rm -rf ${srcdir}/${_svnmod}-build
cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build

cd "torrent-search/trunk"
python2 setup.py build
python2 setup.py install --prefix=/usr --root="${pkgdir}"

}
