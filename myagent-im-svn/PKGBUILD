pkgname=myagent-im-svn
pkgver=118
pkgrel=1
pkgdesc="Mail.Ru Agent"
arch=(i686 x86_64)
url="http://code.google.com/p/myagent-im/"
license="GPL2"
depends=('qt>=4.4' 'zlib' 'xapian-core' 'aspell' 'libxss' 'phonon')
makedepends=('gcc' 'flex' 'pkg-config' 'sed' 'subversion')
source=()

_svntrunk=http://myagent-im.googlecode.com/svn/trunk/
_svnmod=myagent-im-read-only

build()
{
svn co $_svntrunk
msg "SVN checkout done or server timeout"
msg "Starting make..."

cd ${srcdir}/trunk
sed -e '/#include/ s/Phonon/phonon/' -i ./src/soundplayer.h
sed -e '/isEmpty(PREFIX):PREFIX/ s/\/usr\/local/\/usr/' -i ./src/src.pro
qmake
make
make INSTALL_ROOT="$pkgdir" install
}
