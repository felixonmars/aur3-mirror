# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=sftpman
pkgver=20110606
pkgrel=1
pkgdesc="Command Line and GTK application that handles sshfs/sftp file systems mounting."
arch=('any')
url="https://github.com/spantaleev/SftpMan"
license=('BSD')
depends=('pygtk>=2' 'python2>=2.6' 'sshfs')
makedepends=('git' 'python2-distribute')
optdepends=("openssh-askpass: allows you to enter the ssh key's password during mounting [install requires session restart]",
						'nautilus: makes the "Open mount" button in the UI work')
install=$pkgname.install

_gitroot="git://github.com/spantaleev/SftpMan.git"
_gitname="SftpMan"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done"
}

package() {
	cd "$srcdir/$_gitname"
	python2 setup.py install --root=$pkgdir/ --optimize=1

	install -Dm 644 $srcdir/$_gitname/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm 644 $srcdir/$_gitname/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm 644 $srcdir/$_gitname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm 755 $srcdir/$_gitname/sleep.d/49-$pkgname $pkgdir/etc/pm/sleep.d/49-$pkgname
}
