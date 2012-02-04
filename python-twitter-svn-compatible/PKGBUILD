# contributor: Martin Thurau <martin.thurau at gmail.com>
pkgname=python-twitter-svn-compatible
pkgver=176
pkgrel=1
pkgdesc="A python wrapper around the Twitter API. Patched to work with Twitter compatible services"
arch=(any)
url="http://code.google.com/p/python-twitter/"
license=('APACHE')
depends=('python>=2.5' 'python-simplejson')
makedepends=(subversion)
provides=(python-twitter)
conflicts=(python-twitter)
source=(twitter_compatible_api_support.patch)
md5sums=('a77f25e7b7a936ad13028ba95a2cab32') 

_svntrunk="http://python-twitter.googlecode.com/svn/trunk/"
_svnmod=python-twitter

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  cd $_svnmod
  #
  # Patch
  #
  msg "Patching..."
  patch twitter.py ${srcdir}/twitter_compatible_api_support.patch || return 1
  
  #
  # BUILD
  #
  msg "Build and install..."
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}


