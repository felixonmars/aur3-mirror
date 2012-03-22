# Contributor: Tom Vincent <http://www.tlvince.com/>
# Maintainer:Max Kuchugura <maksvlad-at-ya-dot-ru>

pkgname=syncevolution-gtk
_pkgname=syncevolution
pkgver=1.2.2
pkgrel=1
pkgdesc="Provides full two-way synchronization for Evolution via SyncML and \
         Bluetooth without the Evolution/Gnome dependencies."
arch=('i686' 'x86_64')
url="http://syncevolution.org/"
license=('GPL')
depends=('openobex' 'libsoup' 'libgnome-keyring' 'python2' 'intltool' 'kdeutils-kwallet')
optdepends=('twisted: for built-in SyncML server support'
            'python2: for built-in SyncML server support'
            'libnotify: for built-in SyncML server support')
makedepends=('autoconf' 'boost' 'pkg-config')
provides=('syncevolution')
conflicts=('syncevolution' 'syncevolution-git' 'syncevolution-bin')
source=(http://downloads.syncevolution.org/syncevolution/sources/$_pkgname-$pkgver.tar.gz)
#gcc-4.6.patch 7645bb37a393188090831c6e4ce361fa
md5sums=('0f58a4adf0ff034d7ae7f6c8589ed5b0')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    #patch -Nup1 -i ${srcdir}/gcc-4.6.patch
    CXXFLAGS="-fpermissive" ./configure --prefix=/usr \
	--enable-gui \
#	--enable-akonadi \
	--enable-kwallet \
        --disable-ebook \
        --disable-ecal \
        --disable-shared \
        --enable-dbus-service \
        || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
    ln -s "${pkgdir}/usr/libexec/syncevo-dbus-server" \
	  "${pkgdir}/usr/bin/syncevo-dbus-server"
    sed -i 's/\/usr\/bin\/python/\/usr\/bin\/python2/' ${pkgdir}/usr/bin/syncevo-phone-config
    sed -i 's/\/usr\/bin\/python/\/usr\/bin\/python2/' ${pkgdir}/usr/bin/syncevo-http-server
}



 
