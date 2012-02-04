# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=tv_grab_dvb-svn
pkgver=86
pkgrel=1
pkgdesc="A program to dump DVB EPG info in xmltv format."
arch=('i686' 'x86_64')
url="http://www.darkskiez.co.uk/index.php?page=tv_grab_dvb"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
_svntrunk="http://www.darkskiez.co.uk/svn/tv_grab_dvb/trunk"
_svnmod=$pkgname

build() {
  cd "$srcdir"
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  make 
  install -v -D -m 0755 tv_grab_dvb $pkgdir/usr/bin/tv_grab_dvb
}