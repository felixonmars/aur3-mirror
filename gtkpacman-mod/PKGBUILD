# pkgbuild made by hunterm <hunterm.haxxr at gmail dot com>

pkgname=gtkpacman-mod
pkgver=20101206
pkgrel=1
pkgdesc="A modification of GTKPacman that installs packages safer."
arch=('any')
url="https://github.com/hunterm/GtkPacman"
license=('GPL2')
depends=('python2' 'vte' 'libglade' 'glade-perl')
conflicts=('gtkpacman' 'gtkpacman-svn')
_gitroot="git://github.com/hunterm/GtkPacman.git"
_gitname="GtkPacman"

build() {
#cd $startdir/src
#cd "$srcdir"

msg "Connecting to GIT server...."
if [[ -d $_gitname ]] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
else
	git clone $_gitroot $_gitname
fi
msg "GIT checkout done or server timeout"

cd $srcdir
cp -rf $_gitname $_gitname-build
cd $_gitname-build
python2 setup.py install --root=$startdir/pkg

rm -rf $_gitname-build
}
