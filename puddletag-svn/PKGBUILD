# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=puddletag-svn
pkgver=372
pkgrel=2
pkgdesc="An audio tag editor for GNU/Linux."
arch=('i686' 'x86_64')
url="http://puddletag.sourceforge.net/"
license=('GPL')
depends=('python2>=2.5' 'python2-qt>=4.5' 'pyparsing>=1.4' 'mutagen' 'python-configobj' 'python-musicbrainz2')
makedepends=('subversion')
optdepends=('python-imaging: edit/view FLAC cover art'
            'quodlibet: edit a QuodLibet library')
provides=('puddletag')
conflicts=('puddletag')

_svnmod="puddletag"
_svntrunk="https://puddletag.svn.sourceforge.net/svnroot/puddletag"

build() {
cd ${srcdir}

  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

    msg "SVN checkout done or server timeout"

  cd ${srcdir}/${_svnmod}
  python2 setup.py install --prefix=$pkgdir/usr || return 1
}