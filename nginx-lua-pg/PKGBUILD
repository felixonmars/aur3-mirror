# Mantainer: Gianni Vialetto <gianni@rootcube.net>
# Why use openresty when you have makepkg?

_optdir=/opt/nginx-lua-pg
_cfgdir=${_optdir}/etc
_tmpdir=${_optdir}/lib

# Versions
_nginxver=1.4.3
_modluaver=0.9.1
_modpgver=1.0rc3
_devkitver=0.2.19

pkgname=nginx-lua-pg
pkgver=2
pkgrel=1
pkgdesc='Nginx compiled with lua(jit) and postgresql support'
arch=('i686' 'x86_64')
depends=('pcre' 'zlib' 'openssl' 'geoip' 'luajit' 'postgresql-libs')
url="http://nginx.org"
license=('custom')
changelog=CHANGELOG
backup=(${_cfgdir:1}/fastcgi.conf
  ${_cfgdir:1}/fastcgi_params
  ${_cfgdir:1}/koi-win
  ${_cfgdir:1}/koi-utf
  ${_cfgdir:1}/mime.types
  ${_cfgdir:1}/nginx.conf
  ${_cfgdir:1}/scgi_params
  ${_cfgdir:1}/uwsgi_params
  ${_cfgdir:1}/win-utf
  etc/logrotate.d/$pkgname)
source=(http://nginx.org/download/nginx-${_nginxver}.tar.gz
  devkit-${_devkitver}.tar.gz::https://github.com/simpl/ngx_devel_kit/archive/v${_devkitver}.tar.gz
  modlua-${_modluaver}.tar.gz::https://github.com/chaoslawful/lua-nginx-module/archive/v${_modluaver}.tar.gz
  modpg-${_modpgver}.tar.gz::https://github.com/FRiCKLE/ngx_postgres/archive/${_modpgver}.tar.gz
  service
  logrotate)
sha256sums=('ae123885c923a6c3f5bab0a8b7296ef21c4fdf6087834667ebbc16338177de84'
            '501f299abdb81b992a980bda182e5de5a4b2b3e275fbf72ee34dd7ae84c4b679'
            '718990ba13345bfc271276e9c37ac6455f520cac8137613de53b22b071210fc7'
            '6014ac4eef2b46fa591118917f04bfa8870097f93d05c51fb625dd776a3a854a'
            '89b0257440eda064adb413c14b9b4b6adf9ddfbc172e083155f3fb2425b470a1'
            'e748a3218ec7d42ccc8d72c3edd250ec2f58aa478b613608cb3e46cbfee8cd0f')

build() {
	cd "$srcdir"/nginx-${_nginxver}

	# official luajit package info for ngx_lua. This is needed, otherwise
	# the module will try to use the default lua installation, which 
	# won't work currently on Arch (since system lua is 5.2)
	export LUAJIT_LIB=/usr/lib
	export LUAJIT_INC=/usr/include/luajit-2.0

	./configure \
          --prefix=${_cfgdir} \
          --conf-path=${_cfgdir}/nginx.conf \
          --sbin-path=${_optdir}/bin/nginx \
          --pid-path=/var/run/$pkgname.pid \
          --lock-path=/var/lock/$pkgname.lock \
          --user=http --group=http \
          --http-log-path=${_optdir}/log/access.log \
          --error-log-path=${_optdir}/log/error.log \
          --http-client-body-temp-path=${_tmpdir}/client-body \
          --http-proxy-temp-path=${_tmpdir}/proxy \
	  --without-http_fastcgi_module \
	  --without-http_scgi_module \
	  --without-http_uwsgi_module \
          --with-ipv6 --with-pcre-jit \
          --with-file-aio \
          --with-http_dav_module \
          --with-http_geoip_module \
          --with-http_gunzip_module \
          --with-http_gzip_static_module \
          --with-http_realip_module \
          --with-http_spdy_module \
          --with-http_ssl_module \
          --with-http_stub_status_module \
	  --add-module=$srcdir/ngx_devel_kit-${_devkitver} \
          --add-module=$srcdir/lua-nginx-module-${_modluaver} \
	  --add-module=$srcdir/ngx_postgres-${_modpgver} \

	make
}

package() {
	cd "$srcdir"/nginx-${_nginxver}
	make DESTDIR="$pkgdir" install

	sed -e 's|\<user\s\+\w\+;|user html;|g' \
		-e '44s|html|/opt/nginx-lua-pg/share/html|' \
		-e '54s|html|/opt/nginx-lua-pg/share/html|' \
		-i "$pkgdir"${_cfgdir}/nginx.conf
	rm "$pkgdir"${_cfgdir}/*.default

	install -d "$pkgdir${_tmpdir}"
	install -dm700 "$pkgdir${_tmpdir}"/proxy

	chmod 750 "$pkgdir${_optdir}"/log
	chown http:log "$pkgdir${_optdir}"/log

	install -d "$pkgdir${_optdir}"/share
	mv "$pkgdir${_optdir}"/etc/html/ "$pkgdir${_optdir}"/share

	install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/$pkgname
	install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	rm -rf "$pkgdir"/var/run
}
