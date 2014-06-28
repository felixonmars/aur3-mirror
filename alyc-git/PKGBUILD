# Maintainer: Alf <naihe2010 [at] 126 [dot] com>

pkgname=alyc-git
pkgver=2040627
pkgrel=1
pkgdesc="A little cloud client."
arch=('i686' 'x86_64')
url="http://naihe2010.github.com/alyc/"
license=('GPL')
depends=()
makedepends=('python2' 'wxpython' 'python2-urllib3' 'git' 'pyinstaller')
conflicts=('')
options=('!strip' '!upx')
source=()
md5sums=()

_gitroot="https://github.com/naihe2010/alyc.git"
_gitname="alyc"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone -b master $_gitroot $_gitname
	fi
	
	msg "GIT checkout done or server timeout"

	cd "${srcdir}/${_gitname}"
	
	msg "Starting make..."

	pyinstaller -F --clean -n alyc src/agui.py 
}

package()
{
	install -d "$pkgdir"/opt
	cp -R "${srcdir}/${_gitname}"/dist "$pkgdir"/opt/alyc
	cp -R "${srcdir}/${_gitname}"/src/res "$pkgdir"/opt/alyc/res
	chmod 755 "$pkgdir"/opt/alyc/alyc

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/alyc/alyc "$pkgdir"/usr/bin/alyc
}
