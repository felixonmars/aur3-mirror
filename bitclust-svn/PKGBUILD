# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>

pkgname=bitclust-svn
pkgver=3471
pkgrel=1
pkgdesc="the Next-Generation Ruby reference manual interface"
arch=('i686' 'x86_64')
url="http://doc.loveruby.net/wiki/BitClust.html"
license=('ruby')
groups=('devel')
depends=('ruby')
makedepends=('subversion')

source=()
md5sums=()

_svntrunk=http://i.loveruby.net/svn/rubydoc/bitclust/trunk
_svnmod=bitclust

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ruby setup.rb config --prefix=$pkgdir/usr --siterubyver=$pkgdir/usr/lib/ruby/site_ruby/1.8 || return 1
  ruby setup.rb install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
