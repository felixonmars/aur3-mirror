# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Kostin Dmitrij [DsTr] <kostindima@gmail.com>
pkgname=m2t-svn
pkgver=6
pkgrel=1
pkgdesc="CUE+* recursive splitter to flac-tracks"
arch=(i686 x86_64)
url="http://code.google.com/p/m2t/"
license=('GPL')
depends=( ffmpeg flac shntool cuetools enca )
provides=(m2t)
source=( )
md5sums=( )


_svntrunk=http://m2t.googlecode.com/svn/trunk/
_svnmod=m2t-svn

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod

  install -Dm755 m2t /usr/bin/m2t
}
