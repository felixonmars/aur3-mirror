# Contributor: Thomas Ernstorfer

pkgname=passepartout-svn
pkgver=1532
pkgrel=1
pkgdesc="Passepartout is a GTK-based desktop publishing application."
arch=(i686 x86_64)
url="http://www.stacken.kth.se/project/pptout/"
license=("custom:free redistribution while keeping copyright")
depends=('libxml++2' 'gtkmm' 'libgnomecanvasmm' 'ghostscript' 'libxslt')
makedepends=('subversion')
provides=('passepartout')
conflicts=('passepartout')

source=()
md5sums=()

_svntrunk=svn://svn.gnome.org/svn/passepartout/trunk
_svnmod=passepartout

build() {
cd $startdir/src

if [ -d $_svnmod/.svn ]; then
(cd $_svnmod && svn up -r $pkgver)
else
svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
fi

msg "SVN checkout done or server timeout"
msg "Starting make..."

cp -r $_svnmod $_svnmod-build
cd $_svnmod-build

./autogen.sh

./configure --prefix=/usr
make || return 1
make DESTDIR=$startdir/pkg/ install

rm -rf $startdir/src/$_svnmod-build
}
# vim:syntax=sh
