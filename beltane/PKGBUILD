# Maintainer: Bjoern Franke <bjo (at) nord-west.org>
# Contributor: Brad Arrington bradla8 at yahoo.com

pkgname=beltane
pkgver=1.0.19
pkgrel=1
pkgdesc="A web-based central management console for the Samhain file integrity / intrusion detection system"
arch=(i686 x86_64)
url="http://www.la-samhna.de/beltane/index.html"
license=('GPL')
depends=('gcc' 'samhain' 'php')
source=(http://www.la-samhna.de/beltane/${pkgname}-${pkgver}.tar.gz)

md5sums=('4b8c5c8b23225fc9b6d2554fdf78827c')

build() {
	mkdir -p ${pkgdir}/srv/http/beltane/beltane_help
	chmod -R 0755 $pkgdir/srv/http/beltane/beltane_help
	mkdir -p $pkgdir/var/lib/yule
	mkdir $pkgdir/var/lib/yule/profiles
	mkdir -p $pkgdir/usr/bin
        mkdir $pkgdir/srv/http/beltane/js
        mkdir $pkgdir/srv/http/beltane/pix
  
	chgrp root /var/lib/yule
	chmod g+rx /var/lib/yule
	chgrp root /var/lib/yule/profiles
	chmod g+rwx /var/lib/yule/profiles

  	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --with-php-dir=/srv/http/beltane
	make 
}
package() {
  	install -c -s -m 755 beltane_update $pkgdir/usr/bin/beltane_update
  	install -c -s -m 755 beltane_cp $pkgdir/usr/bin/beltane_cp
	install -c -m 755 php/auth.cgi $pkgdir/srv/http/beltane/auth.cgi
	install -c -m 755 php/clients.cgi $pkgdir/srv/http/beltane/clients.cgi
	install -c -m 755 php/index.cgi $pkgdir/srv/http/beltane/index.cgi
	install -c -m 755 php/menu.cgi $pkgdir/srv/http/beltane/menu.cgi
	install -c -m 755 php/configure.cgi $pkgdir/srv/http/beltane/configure.cgi
	install -c -m 755 php/messages.cgi $pkgdir/srv/http/beltane/messages.cgi
	install -c -m 755 php/sigupdate.cgi $pkgdir/srv/http/beltane/sigupdate.cgi
	install -c -m 755 php/serverStatus.cgi $pkgdir/srv/http/beltane/serverStatus.cgi
	install -c -m 644 php/auth_check.inc $pkgdir/srv/http/beltane/auth_check.cgi
	install -c -m 644 php/config.inc $pkgdir/srv/http/beltane/config.cgi
	install -c -m 644 php/db.inc $pkgdir/srv/http/beltane/db.cgi
	install -c -m 644 php/sql.inc $pkgdir/srv/http/beltane/sql.cgi
	install -c -m 644 php/js/changeimg.js $pkgdir/srv/http/beltane/js/changeimg.js
	install -c -m 644 php/js/md5.js $pkgdir/srv/http/beltane/js/md5.js
	install -c -m 644 php/js/sel.js $pkgdir/srv/http/beltane/js/sel.js
	install -c -m 644 php/js/overlib.js $pkgdir/srv/http/beltane/js/overlib.js
	install -c -m 644 php/js/overlib_custom.js $pkgdir/srv/http/beltane/js/overlib_custom.js
	install -c -m 644 php/js/cr.js $pkgdir/srv/http/beltane/js/cr.js
	install -c -m 644 php/pix/dl.png $pkgdir/srv/http/beltane/pix/dl.png
	install -c -m 644 php/pix/dl_hi.png $pkgdir/srv/http/beltane/pix/dl_hi.png
	install -c -m 644 php/pix/dl_ok.png $pkgdir/srv/http/beltane/pix/dl_ok.png
	install -c -m 644 php/pix/dl_ok_hi.png $pkgdir/srv/http/beltane/pix/dl_ok_hi.png
	install -c -m 644 php/pix/dr.png $pkgdir/srv/http/beltane/pix/dr.png
	install -c -m 644 php/pix/d_sstatus.png $pkgdir/srv/http/beltane/pix/d_sstatus.png
	install -c -m 644 php/pix/d_sstatus_hi.png $pkgdir/srv/http/beltane/pix/d_sstatus_hi.png
	install -c -m 644 php/pix/dr_cancel.png $pkgdir/srv/http/beltane/pix/dr_cancel.png
	install -c -m 644 php/pix/dr_cancel_hi.png $pkgdir/srv/http/beltane/pix/dr_cancel_hi.png
	install -c -m 644 php/pix/dr_hi.png $pkgdir/srv/http/beltane/pix/dr_hi.png
	install -c -m 644 php/pix/d_undo.png $pkgdir/srv/http/beltane/pix/d_undo.png
	install -c -m 644 php/pix/d_undo_hi.png $pkgdir/srv/http/beltane/pix/d_undo_hi.png
	install -c -m 644 php/pix/d_update.png $pkgdir/srv/http/beltane/pix/d_update.png
	install -c -m 644 php/pix/d_update_hi.png $pkgdir/srv/http/beltane/pix/d_update_hi.png
	install -c -m 644 php/pix/d_selectall.png $pkgdir/srv/http/beltane/pix/d_selectall.png
	install -c -m 644 php/pix/d_confirm.png $pkgdir/srv/http/beltane/pix/d_confirm.png
	install -c -m 644 php/pix/d_reset.png $pkgdir/srv/http/beltane/pix/d_reset.png
	install -c -m 644 php/pix/d_selectall_hi.png $pkgdir/srv/http/beltane/pix/d_selectall_hi.png
	install -c -m 644 php/pix/d_confirm_hi.png $pkgdir/srv/http/beltane/pix/d_confirm_hi.png
	install -c -m 644 php/pix/d_reset_hi.png $pkgdir/srv/http/beltane/pix/d_reset_hi.png
	install -c -m 644 php/pix/logo.png $pkgdir/srv/http/beltane/pix/logo.png
	install -c -m 644 php/pix/logo_f3f3f3.png $pkgdir/srv/http/beltane/pix/logo_f3f3f3.png
	install -c -m 644 php/pix/ul.png $pkgdir/srv/http/beltane/pix/ul.png
	install -c -m 644 php/pix/ul_hi.png $pkgdir/srv/http/beltane/pix/ul_hi.png
	install -c -m 644 php/pix/ur.png $pkgdir/srv/http/beltane/pix/ur.png
	install -c -m 644 php/pix/ur_hi.png $pkgdir/srv/http/beltane/pix/ur_hi.png
	install -c -m 644 php/pix/valid-xhtml10.png $pkgdir/srv/http/beltane/pix/valid-xhtml10.png
	install -c -m 644 php/pix/i_alrt.png $pkgdir/srv/http/beltane/pix/i_alrt.png
	install -c -m 644 php/pix/i_crit.png $pkgdir/srv/http/beltane/pix/i_crit.png
	install -c -m 644 php/pix/i_erro.png $pkgdir/srv/http/beltane/pix/i_erro.png
	install -c -m 644 php/pix/i_info.png $pkgdir/srv/http/beltane/pix/i_info.png
	install -c -m 644 php/pix/i_none.png $pkgdir/srv/http/beltane/pix/i_none.png
	install -c -m 644 php/pix/i_warn.png $pkgdir/srv/http/beltane/pix/i_warn.png
	install -c -m 644 php/pix/onepix.gif $pkgdir/srv/http/beltane/pix/onepix.gif
	install -c -m 644 php/beltane_formate.css $pkgdir/srv/http/beltane/beltane_formate.css
	install -c -m 644 php/index.html $pkgdir/srv/http/beltane/index.html
	install -c -m 644 php/valid.html $pkgdir/srv/http/beltane/valid.html
	install -c -m 644 php/cruft.html $pkgdir/srv/http/beltane/cruft.html
	install -c -m 644 php/control.html $pkgdir/srv/http/beltane/control.html
	install -c -m 644 php/logo.html $pkgdir/srv/http/beltane/logo.html
	mkdir -p $pkgdir/etc/php
	install -c -m 600 php/beltanerc $pkgdir/etc/php/beltanerc
	# chown root:root $pkgdir/etc/php/beltanerc
	chown -R root:root $pkgdir/srv/http/beltane
}
