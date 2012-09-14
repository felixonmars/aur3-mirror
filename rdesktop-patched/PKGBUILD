# Contributor: vldmr <vldmr@lavabit.com>
pkgname=rdesktop-patched
pkgver=1.6.0
pkgrel=1
provides=(rdesktop)
conflicts=(rdesktop)
depends=('libx11' 'openssl' 'libao' 'libsamplerate')
pkgdesc="Client for connect to Windows Terminal Servers. Patched version with RedHat and Alt Linux patches"
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.rdesktop.org/"
install='rdesktop-patched.install'

source=("http://downloads.sourceforge.net/rdesktop/rdesktop-$pkgver.tar.gz" 
		'remote-file-access.patch'
		'rdesktop-1.6_auto_raw_keyboard.patch'
		'rdesktop-alt-man.patch'
		'rdesktop.long.names.on.redirect.drives.patch'
		'common_mod'
		'ru_mod')

md5sums=('c6fcbed7f0ad7e60ac5fcb2d324d8b16'
		 '5b9892d4665b8a75e6cb91f7b0622bf6'
		 '43ecd8c63410489674c9d8386bda4701'
		 '6e126c35632bb589b29b1ab77eecd233'
		 'aba6bba230e0a2edd3316e2a24e2a40b'
		 '7a0efef4312542e37d422eccdcdcfbca'
		 'd216adbf74cd1686d3c5443e0bd39b95')

build() {
   cd $srcdir/rdesktop-$pkgver
   patch -Np0 -b -i $startdir/remote-file-access.patch
   patch -Np1 -i $startdir/rdesktop-1.6_auto_raw_keyboard.patch
   patch -Np1 -i $startdir/rdesktop-alt-man.patch
   patch -Np1 -i $startdir/rdesktop.long.names.on.redirect.drives.patch
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}

package() {
	cp -f $srcdir/common_mod $pkgdir/usr/share/rdesktop/keymaps
	cp -f $srcdir/ru_mod $pkgdir/usr/share/rdesktop/keymaps
}

