# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=python2-wikipedia-rewrite-svn
pkgver=9007
pkgrel=1
pkgdesc="A rewrite of the Python Wikipedia Robot Framework. It features several improvements, such as full API usage and a pythonic package layout. (also known as pywikibot)"
arch=('i686' 'x86_64')
url="http://toolserver.org/~pywikipedia/nightly/"
license=('MIT')
depends=('python2' 'python2-httplib2')
makedepends=('python2' 'python2-distribute' 'subversion')
install="python2-wikipedia-rewrite.install"
source=(# "http://toolserver.org/~pywikipedia/nightly/package/pywikipedia-rewrite/pywikipedia-rewrite-nightly.tar.bz2"
    "user-config.py")
md5sums=('1bc425f932e8bbd05c0f4fe062029305')

# Use svn instead of the nightly builds (it is a lot easier to manage, think of the md5sum array...)
_svntrunk=http://svn.wikimedia.org/svnroot/pywikipedia/branches/rewrite/
_svnmod=pywikibot-rewrite

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # This is really a pain : interactive setup to create a per-user config file...
  # We just provide a sample config file in /usr/share/pywikibot/user-config.py
  grep -v "generate_user_files.py" setup.py > setup.py.tmp
  mv setup.py.tmp setup.py

}

package() {
    cd "$srcdir/$_svnmod-build"

    # This is _really_ a pain... It installs itself in
    #  /usr/lib/python2.7/site-packages/pywikibot
    #  /usr/lib/python2.7/site-packages/tests
    #  /usr/lib/python2.7/site-packages/scripts
    # The two last are likely to collide with others python packages...
    # => This has to be fixed upstream
    python2 setup.py install --prefix=/usr --root=$pkgdir

    # HELP ! This is an _awful_ hack !!
    rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests
    
    # Copy our example config file
    cd $srcdir
    mkdir -p $pkgdir/usr/share/pywikibot
    install user-config.py $pkgdir/usr/share/pywikibot

}
