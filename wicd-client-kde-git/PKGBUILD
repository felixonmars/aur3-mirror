# Contributor: Marvn <mistrmarvn@gmail.com>

pkgname=wicd-client-kde-git
pkgver=20110404
pkgrel=1
pkgdesc="Wicd client build on the KDE Development Platform"
arch=("i686" "x86_64")
url="http://kde-apps.org/content/show.php/Wicd+Client+KDE?content=132366"
license=('GPL')
depends=('kdelibs' 'qt' 'wicd')
makedepends=('cmake' 'git')
conflicts=('wicd-client-kde')
_gitroot="git://gitorious.org/wicd-client-kde/wicd-client-kde.git"
_gitname="wicd-client-kde"

build() {
	msg "Connecting to GIT server...."

	
	[ -d $_gitname ] && {
		cd $_gitname
		git pull origin
		cd ..

		msg "Local files have been updated."
	} || {
		git clone $_gitroot
	}

	msg "GIT checkout done or server timeout"

	rm -rf $_gitname-build
	git clone $_gitname $_gitname-build
	cd $_gitname-build 
        cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DPYTHONBIN=python2 . || return 1
        make || return 1
  
}

package()
{
  cd ${srcdir}/$_gitname-build || return 1
  make DESTDIR=${pkgdir} install || return 1
}
