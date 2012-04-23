pkgname=git-merge-changelog-git
pkgver=20120423 
pkgrel=1
pkgdesc="Helper for automatically merge Changelog files with git or mercurial"
arch=('any')
license=('GPL')
url="http://gnu.org/software/gnulib/"
provides=('git-merge-changelog')
depends=()
makedepends=('gcc' 'git')

_gitname="gnulib"
_gitroot="git://git.savannah.gnu.org"

build() {
	cd $srcdir
	msg "Connecting to the GIT server..."

	if [[ -d $srcdir/$_gitname ]] ; then
		cd $_gitname
		git pull origin
		msg "The local files were updated."
	else
		git clone "$_gitroot/$_gitname.git"
fi

    msg "GIT checkout done"
    msg "Starting make..."

		cd $srcdir/$_gitname
		./gnulib-tool --create-testdir --dir=$srcdir/$_gitname-build git-merge-changelog

		mkdir $pkgdir/usr

		cd $srcdir/$_gitname-build

		./configure --prefix=$pkgdir/usr || return 1
		make || return 1
		make install || return 1

		rm -rf $srcdir/$_gitname-build
}

			
