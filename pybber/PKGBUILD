#Contributor: MiddleofDreams <middleofdreams at gmail dot com>
pkgname=pybber
pkgver=0.095
pkgrel=1
pkgdesc="Pybber is experimental Jabber/XMPP client. One-window mode. 0.1 Beta 2 Release"
arch=('i686')
url="http://middleofdreams.wordpress.com/pybber"
license=('GPL')
depends=('python' 'python-dnspython' 'pygtk' 'gtk2' 'libwebkit' 'pywebkitgtk' 'xmpppy' 'libnotify' 'python-notify')
makedepends=()
optdepends=()
source=(http://cloud.github.com/downloads/middleofdreams/$pkgname/$pkgname$pkgver.tar.gz $pkgname.sh $pkgname.desktop)
md5sums=('5de40c6ca5bc4c655e07c9ad214da7b0'
         'f48663e452b07d7d48475e115cd741cc'
         '09cb5f431f447d5510bd2596286e73a0')
         
build() {
  install -d $pkgdir/usr/{bin/,share/applications,share/pybber}

 	install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
	cp -r $srcdir/$pkgname/ $pkgdir/usr/share/
	chmod 755 -R $pkgdir/usr/share/pybber
   
}

