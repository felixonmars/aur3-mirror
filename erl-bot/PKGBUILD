# Contributor: Nick Rudov <nrudov@gmail.com>
pkgname=erl-bot
pkgver=0.5.0
pkgrel=1
pkgdesc="Erlang Jabber Bot"
arch=('i686' 'x86_64')
url="http://a7x-im.com/"
license=('GPL')
depends=('erlang')
install=erl-bot.install
source=(http://a7x-im.com/download/$pkgname-aur-$pkgver.tar.gz)
md5sums=('e7a40027517255aec3bc954de349cefb')


build() {
	#Compiling drivers
	cd $srcdir/erl-bot-aur-0.5.0/src/driver
	gcc -g -O2 -Wall drv_tls.c -lssl -lcrypto -I /usr/include \
	-L /usr/lib -L /usr/lib/erlang/lib/er*/lib -l erl_interface \
	-lei -I /usr/lib/erlang/lib/er*/include -I /usr/lib/erlang/usr/include \
	-o drv_tls.so -fpic -shared
	gcc -g -O2 -Wall drv_zlib.c -lz -I /usr/include -L /usr/lib \
	-L /usr/lib/erlang/lib/er*/lib -l erl_interface \
	-lei -I /usr/lib/erlang/lib/er*/include -I /usr/lib/erlang/usr/include \
	-o drv_zlib.so -fpic -shared
	gcc -g -O2 -Wall drv_xml.c -lexpat -I /usr/include -L /usr/lib \
	-L /usr/lib/erlang/lib/er*/lib -l erl_interface \
	-lei -I /usr/lib/erlang/lib/er*/include -I /usr/lib/erlang/usr/include \
	-o drv_xml.so -fpic -shared
	rm *.c
	
	#Compiling bot
	cd $srcdir/erl-bot-aur-0.5.0/src/kernel
	sed -i 's/"driver"/"\/usr\/share\/erl-bot\/driver"/g' xmpp_xml.erl
	sed -i 's/"driver"/"\/usr\/share\/erl-bot\/driver"/g' xmpp_tls.erl
	sed -i 's/"driver"/"\/usr\/share\/erl-bot\/driver"/g' xmpp_zlib.erl
	erlc -W -DSSL39 *.erl
	rm *.erl
	
	cd $srcdir/erl-bot-aur-0.5.0/src/
	mkdir -p $pkgdir/usr/share/erl-bot
	cp -fr driver $startdir/pkg/usr/share/erl-bot/
	cp -fr kernel $startdir/pkg/usr/share/erl-bot/
	cd $srcdir/erl-bot-aur-0.5.0/src/etc/
	mkdir -p $startdir/pkg/etc/erl-bot
	cp -fr erl-bot $startdir/pkg/etc/
	mkdir -p $pkgdir/var/spool
	cd $srcdir/erl-bot-aur-0.5.0/src/var/spool
	cp -fr erl-bot $startdir/pkg/var/spool/
	cd $srcdir/erl-bot-aur-0.5.0/src/
	mkdir -p $startdir/pkg/var/log/erl-bot
	mkdir -p $startdir/pkg/bin/
	sed -i 's/BIN_DIR=kernel/BIN_DIR=\/usr\/share\/erl-bot\/kernel/g' erl-bot
	cp erl-bot $startdir/pkg/bin/ || return 1
}
