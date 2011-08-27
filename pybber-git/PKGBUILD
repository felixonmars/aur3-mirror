#Contributor: MiddleofDreams <middleofdreams at gmail dot com>
pkgname=pybber-git
pkgver=0.1
pkgrel=2
pkgdesc="Pybber is experimental Jabber/XMPP client. One-window mode. Latest revision from git"
arch=('i686')
url="http://middleofdreams.wordpress.com/pybber"
license=('GPL')
depends=('python' 'python-dnspython' 'pygtk' 'gtk2' 'libwebkit' 'pywebkitgtk' 'xmpppy' 'libnotify' 'python-notify')
makedepends=('git')
optdepends=()
source=(pybber.sh pybber.desktop)
md5sums=('f48663e452b07d7d48475e115cd741cc'
         '09cb5f431f447d5510bd2596286e73a0')
conflicts=('pybber')
provides=('pybber')         
build() {
  install -d $pkgdir/usr/{bin/,share/applications,share/pybber}

 	install -Dm755 $srcdir/pybber.sh $pkgdir/usr/bin/pybber
	install -Dm644 $srcdir/pybber.desktop $pkgdir/usr/share/applications/
	git clone git://github.com/middleofdreams/pybber.git
	
   cp -r $srcdir/pybber/ $pkgdir/usr/share/
	chmod 755 -R $pkgdir/usr/share/pybber
   
}

