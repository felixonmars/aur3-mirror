# $Id: PKGBUILD 27981 2010-10-01 09:31:35Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>

_doc_root=/srv/http
_server_root=/etc/nginx
_conf_path=${_server_root}/conf
_tmp_path=/var/spool/nginx
_log_path=/var/log/nginx
_user=http
_group=http

pkgname=nginx-admiral0
pkgver=0.8.53
pkgrel=2
pkgdesc="lightweight HTTP server and IMAP/POP3 proxy server, with upload and push modules"
arch=('i686' 'x86_64')
depends=('pcre' 'zlib' 'openssl')
provides=('nginx')
conflicts=('nginx')
url="http://nginx.net/"
license=('custom')
backup=("${_conf_path#/}/nginx.conf" \
	"${_conf_path#/}/koi-win" \
	"${_conf_path#/}/koi-utf" \
	"${_conf_path#/}/win-utf" \
	"${_conf_path#/}/mime.types" \
	"${_conf_path#/}/fastcgi_params" \
	"etc/logrotate.d/nginx")
source=(http://sysoev.ru/nginx/nginx-${pkgver}.tar.gz \
	nginx
	http://github.com/masterzen/nginx-upload-progress-module/tarball/v0.8.1
	http://pushmodule.slact.net/downloads/nginx_http_push_module-0.692.tar.gz)

build() {
	local _src_dir=$srcdir/nginx-${pkgver}
	local _build_dir=$_src_dir/objs

	cd $_src_dir
	./configure \
		--prefix=${_server_root} \
		--sbin-path=/usr/sbin/nginx \
		--pid-path=/var/run/nginx.pid \
		--lock-path=/var/lock/nginx.lock \
		--http-client-body-temp-path=${_tmp_path}/client_body_temp \
		--http-proxy-temp-path=${_tmp_path}/proxy_temp \
		--http-fastcgi-temp-path=${_tmp_path}/fastcgi_temp \
		--http-log-path=${_log_path}/access.log \
		--error-log-path=${_log_path}/error.log \
		--user=${_user} --group=${_group} \
		--with-imap --with-imap_ssl_module --with-http_ssl_module \
		--with-http_stub_status_module \
		--with-http_dav_module \
		--with-http_sub_module \
		--with-ipv6 \
		--add-module=${srcdir}/masterzen-nginx-upload-progress-module-c740674 \
		--add-module=${srcdir}/nginx_http_push_module-0.692

	make || return 1
	make DESTDIR=$pkgdir install || return 1

	install -d $pkgdir/etc/logrotate.d/
	cat <<- EOF > $pkgdir/etc/logrotate.d/nginx
	$_log_path/*log {
		create 640 http log
		compress
		postrotate
			/bin/kill -USR1 \`cat /var/run/nginx.pid 2>/dev/null\` 2> /dev/null || true
		endscript
	}
	EOF

	sed -i -e "s/\<user\s\+\w\+;/user $_user;/g" $pkgdir/$_conf_path/nginx.conf

	install -d $pkgdir/$_tmp_path

	# move default document root outside server root
	install -d $pkgdir/$_doc_root
	mv $pkgdir/$_server_root/html/* $pkgdir/$_doc_root/
	rm -rf $pkgdir/$_server_root/html
	rm -f $pkgdir/$_doc_root/index.html

	# let's create links for relative paths in config file
	ln -s $_log_path $pkgdir/$_server_root/logs && \
	ln -s $_doc_root $pkgdir/$_server_root/html || return 1

	install -D -m755 $srcdir/nginx $pkgdir/etc/rc.d/nginx && \
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/nginx/LICENSE && \
	mkdir -p $pkgdir/etc/conf.d && \
	echo "NGINX_CONFIG=/etc/nginx/conf/nginx.conf" >$pkgdir/etc/conf.d/nginx
}
md5sums=('717eaea1b34e8663849f64b9aa05a9da'
         '998fe7467e9abfb414cc6ae23475bea9'
         '7095d7ea2857bc149ddc7008fb9545c4'
         'a948638005669d159fa331a35c066fae')
