#Maintainer: Thriqon <aur@jonasw.de>
pkgname="springer_download"
pkgver=20111009
pkgrel=1
pkgdesc="Download SpringerLink-EBooks"
arch=(any)
url="http://milianw.github.com/springer_download"
license=('GPLv3')
groups=
provides=
depends=('python2' 'glibc' 'imagemagick')
makedepends=('git')
optdepends=('pdftk: to use pdftk as merger' 'stapler: to use stapler as merger')

source=(springer_download)
md5sums=('1cb6f55db1b62389966d114422e954f2')

_gitroot="git://github.com/milianw/springer_download.git"
_gitname="springer_download-build"

build()
{
	cd "${srcdir}"
	msg "Connecting to GIT-Server..."

	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated"
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT clone done or server timeout"
}

package()
{
	cd "$srcdir/$_gitname"

	install -D -m755 ../springer_download "${pkgdir}/usr/bin/springer_download"
	install -D -m755 springer_download.py "${pkgdir}/usr/share/springer_download/springer_download.py"
	install -D -m644 README "${pkgdir}/usr/share/springer_download/README"
	install -D -m644 TODO "${pkgdir}/usr/share/springer_download/TODO"
}

