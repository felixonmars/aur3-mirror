# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: SakalisC <chrissakalis (gmail)>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys-svn
_svn_name="logkeys"
pkgver=105
pkgrel=1
pkgdesc="Simple keylogger supporting also USB keyboards."
license=('GPLv3')
arch=('i686' 'x86_64')
optdepends=('logkeys-keymaps-svn: for additional keymaps')
makedepends=('subversion')
conflicts=('logkeys')
provides=('logkeys')
url="http://logkeys.googlecode.com/"
install=logkeys.install
backup=('etc/conf.d/logkeysd')
source=("logkeysd" "logkeysd.conf" "logkeys.service"
        "$_svn_name::svn+http://logkeys.googlecode.com/svn/trunk/")

md5sums=('252cf4080fef3bbd06fa3d67b4f7c037'
         'c05608a47e303e8f604f46d1ed22aa4a'
         'bd70a5e5601168bbf7bf7f91ee530d14'
         'SKIP')

pkgver() {
	cd "$SRCDEST/$_svn_name"
	svnversion |tr -d [A-z]
}

build() {
	cd "$srcdir/$_svn_name/build"
	../configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_svn_name/build"
	make prefix="$pkgdir/usr" install

	install -Dm0755 "$srcdir/logkeysd" "$pkgdir/etc/rc.d/logkeysd"
	install -Dm0755 "$srcdir/logkeysd.conf" "$pkgdir/etc/conf.d/logkeysd"
	install -Dm0644 "$srcdir/logkeys.service" "$pkgdir/usr/lib/systemd/system/logkeys.service"
}

