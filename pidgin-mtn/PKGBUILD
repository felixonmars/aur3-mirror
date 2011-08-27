# Contributor: Carbon Jiao <http://archlive-pkg.googlecode.com>

pkgname=pidgin-mtn
pkgver=20091028
#pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="Pidgin from latest mtn database, with gtalk video/audio support and extra with Chinese Fetion support"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('avahi' 'dbus-glib' 'farsight2' 'nss' 'startup-notification' 'libnice' 'libidn')
makedepends=('monotone' 'ca-certificates' 'python' 'perlxml' 'intltool' 'gtkspell' 'tcl' 'tk')
optdepends=()
provides=('pidgin' 'linux-fetion')
conflicts=('pidgin')
options=('!libtool')
install=pidgin.install
source=(autogen.sh  protocol-makefile.patch config.patch pastie-649601.diff)

build() {

	cd "$startdir"
	if [ -f "mtn/pidgin.mtn" ]; then
		msg2 "Updating sources..."
		mtn -d mtn/pidgin.mtn db migrate
		mtn pull -d mtn/pidgin.mtn || return 1
	else
		msg2 "Downloading the mtn source, ..."
		[ -d mtn ] && mkdir mtn
		pushd mtn 1>/dev/null
		wget http://developer.pidgin.im/static/pidgin.mtn.bz2 1>/dev/null 2>/dev/null
		bzip2 -d pidgin.mtn.bz2 1>/dev/null
	fi

	cd "$srcdir"
	msg "Creating build branch..."
	[ -d $srcdir/im.pidgin.pidgin ] && rm -rf "$srcdir/im.pidgin.pidgin"
	mtn -d $startdir/mtn/pidgin.mtn co -b im.pidgin.pidgin

	msg "Fetch protocl of Chinese Fetion"
	git clone git://github.com/gradetwo/fetion.git $srcdir/fetion
	rm -rf `find $srcdir/fetion -name .git`
	cp -r $srcdir/fetion $srcdir/im.pidgin.pidgin/libpurple/protocols/
	cp $srcdir/autogen.sh $srcdir/im.pidgin.pidgin/

	cd $srcdir/im.pidgin.pidgin
	patch -Np1 -i $srcdir/config.patch
	patch -Np1 -i $srcdir/protocol-makefile.patch

	#patch pidgin for msn plus plugin
	patch -Np0 -i $srcdir/pastie-649601.diff

	msg "Start to compile and install pidgin"
	cd $srcdir/${_gitname}-build
	./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-meanwhile \
		--disable-nm --disable-perl --disable-gnutls --enable-cyrus-sasl --enable-vv --disable-doxygen \
		--with-system-ssl-certs=/etc/ssl/certs || return 1

	make || return 1
	make DESTDIR="$pkgdir" install || return 1

#	# 删除中文外的语言包  Delete the locale files except Chinese
#	find ${pkgdir}/usr/share/locale/* -maxdepth 0 -type d ! -iregex ".*zh.CN" -exec rm -rf {} \;

#	# Remove GConf schema file
#	rm -rf "$pkgdir/etc" || return 1

#	# Remove libpurple and pidgin development headers
#	rm -rf "$pkgdir/usr/include" || return 1

#	# Remove pkgconfig scripts
#	rm -rf "$pkgdir/usr/lib/pkgconfig" || return 1

#	# Remove libpurple aclocal macro file
#	rm -rf "$pkgdir/usr/share/aclocal" || return 1
}

md5sums=('007c6b13756fa32e03ea39a8478fec1a'
         '66cc2d20b0e15e5948662b42f7cb5fad'
         '7845b5b5f263f48790939cd9e31dc375'
         'eb60e05ef5945b9be784230e466ef9a2')
