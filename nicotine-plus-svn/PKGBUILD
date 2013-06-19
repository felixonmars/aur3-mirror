# Contributor: x-demon 
# Maintainer : anonymous_user 
pkgname=nicotine-plus-svn
pkgver=1520
pkgrel=1
pkgdesc="A fork of nicotine, a Soulseek music-sharing client written in python. SVN version."
depends=('pygtk' 'gtk2')
makedepends=('subversion' 'python2')
optdepends=('mutagen: To improve metadata'
	    'python-sexy: To enable spell checking'
	    'python-geoip: To enable Geographical blocker')
conflicts=('nicotine' 'nicotine-plus')
replaces=('nicotine' 'nicotine-plus')
url=("http://nicotine-plus.org")
arch=('i686' 'x86_64')
license=('GPL')
source=(svn+http://nicotine-plus.org/svn/trunk/nicotine+)
md5sums=('SKIP')

_svnmod="nicotine+"

pkgver(){
  cd "$SRCDEST/$_svnmod"
  svnversion | tr -d [A-z]
}

build() {
  cd $srcdir/$_svnmod
  python2 setup.py install --root=$srcdir/pkg
}

package(){
  mv ${srcdir}/pkg/* ${pkgdir}  
}
