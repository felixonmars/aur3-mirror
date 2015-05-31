# Maintainer: Tjaart van der walt <aur@tjaart.co.za>
#    Creator: Jimmy Tang <jtang@tchpc.tcd.ie>
pkgname=mr-git
pkgrel=1
pkgdesc="The mr command can checkout, update, or perform other actions on a set of repositories as if they were one combined respository."
arch=('any')
source=("git://myrepos.branchable.com/$pkgname")
url="https://myrepos.branchable.com/"
license=('GPL')
makedepends=('git')
depends=('perl' 'perl-libwww' 'perl-html-parser' 'perl-uri')
optdepends=('git: support for git repositories'
	    'cvs: support for cvs repositories'
	    'svn: support for subversion repositories'
	    'mercurial: support for mercurial repositories'
	    'bzr: support for bzr repositories'
	    'darcs: support for darcs repositories')

# Since we use the latest git repo there is not much sense in using checksums
md5sums=('SKIP')

# I tried to use the pkgver() function, but it seems to always return -1 for some reason.
pkgver=`cd $pkgname; git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'`

package() {
        cd "$srcdir/$pkgname"
        make -e DESTDIR="$pkgdir/" install
}
