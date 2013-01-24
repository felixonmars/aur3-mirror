#Contributor: Mihai Coman <mihai@m1x.ro>

pkgname=exitx-systemd-git
pkgver=20130124
pkgrel=1
pkgdesc="GTK logout dialog for Openbox with systemd support"
arch=('i686' 'x86_64')
url="https://github.com/z0id/exitx-polkit/tree/systemd"
license=('GPL2')
depends=('gtk2' 'gettext' 'pm-utils' 'systemd')
conflicts=('exitx-polkit-git')

_gitroot=https://github.com/z0id/exitx-systemd
_gitname=master

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	
	msg "GIT checkout done or server timeout"

    	cd $srcdir/$_gitname
	make

 
}
package() {
    install -Dm755 ${srcdir}/${_gitname}/exitx  ${pkgdir}/usr/bin/exitx
	}
