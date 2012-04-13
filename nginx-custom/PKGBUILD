# Maintainer: Alexander Kuznecov <akuznecov@adyax.com>

_pkgname="nginx"
_user="http"
_group="http"
_doc_root="/usr/share/${_pkgname}/http"
_sysconf_path="etc"
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/spool/${_pkgname}"
_pid_path="/var/run"
_lock_path="/var/lock"
_log_path="/var/log/${_pkgname}"

# 3d party modules versions:
_cachepurge_ver="1.5"
_slowfscache_ver="1.8"
_echo_ver="v0.38rc2"
_headersmore_ver="v0.16"
_uploadprogress_ver="v0.8.4"
_upstreamfair_hash="a18b4099fbd458111983200e098b6f0c8efed4bc"

pkgname=nginx-custom
pkgver=1.0.15
pkgrel=1
pkgdesc="lightweight HTTP server and IMAP/POP3 proxy server with standard, additional and 3d party modules"
arch=('i686' 'x86_64')

depends=('pcre' 'zlib' 'openssl')
makedepends=(
	'libxslt'
	'gd'
)

url="http://nginx.org"
license=('custom')
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel') 
provides=('nginx')
backup=("${_conf_path#/}/conf/nginx.conf"
	"${_conf_path#/}/conf/koi-win"
	"${_conf_path#/}/conf/koi-utf"
	"${_conf_path#/}/conf/win-utf"
	"${_conf_path#/}/conf/mime.types"
	"${_conf_path#/}/conf/fastcgi.conf"
	"${_conf_path#/}/conf/fastcgi_params"
	"${_conf_path#/}/conf/scgi_params"
	"${_conf_path#/}/conf/uwsgi_params"
	"etc/logrotate.d/nginx")
_user=http
_group=http

source=("http://nginx.org/download/nginx-$pkgver.tar.gz"
        "http://labs.frickle.com/files/ngx_cache_purge-${_cachepurge_ver}.tar.gz"
		"http://labs.frickle.com/files/ngx_slowfs_cache-${_slowfscache_ver}.tar.gz"
		"https://github.com/masterzen/nginx-upload-progress-module/tarball/${_uploadprogress_ver}"
		"https://github.com/agentzh/headers-more-nginx-module/tarball/${_headersmore_ver}"
		"https://github.com/agentzh/echo-nginx-module/tarball/${_echo_ver}"
		"https://github.com/gnosek/nginx-upstream-fair/tarball/${_upstreamfair_hash}"
		"nginx.sh"
		"nginx.conf"
		"nginx.logrotate")

md5sums=('17da4802209b83d9bebb0f0edd975dfc'
         '16079e63b88b0292f9b697e9c209fdea'
         '324e9229e4bd6dc9494fe2b53589d1cf'
         '9a6acb984d81f5d7e04214d63ae94273'
         '51a07e86915c22d895ed0ed53fde14ab'
         '5219e96d874929026fe2032bb4ae62c7'
         'ac5e7f485476af70e0ee1c52016cddaf'
         '0e8032d3ba26c3276e8c7c30588d375f'
         '1fe7a3ca0773ce13f9f92e239a99f8b9'
         '9dfca4c46969d3f620ed40b12c560637')

build() {
	local _src_dir="${srcdir}/${_pkgname}-${pkgver}"
	local _build_dir="${_src_dir}/objs"
    local _cachepurge_dirname="ngx_cache_purge-${_cachepurge_ver}"
	local _slowfscache_dirname="ngx_slowfs_cache-${_slowfscache_ver}"
	local _headersmore_dirname="ngx_headers_more-${_headersmore_ver}"
	local _echo_dirname="ngx_echo-${_echo_ver}"
	local _uploadprogess_dirname="ngx_upload_progress-${_uploadprogress_ver}"
	local _upstreamfair_dirname="ngx_upstream_fair"

	mv agentzh-headers-more-nginx-module-* ${_headersmore_dirname}
	mv agentzh-echo-nginx-module-* ${_echo_dirname}
	mv masterzen-nginx-upload-progress-module-* ${_uploadprogess_dirname}
	mv gnosek-nginx-upstream-fair-* ${_upstreamfair_dirname}

	cd $_src_dir

	./configure \
		--prefix="/${_conf_path}" \
		--sbin-path="/usr/sbin/${_pkgname}" \
		--pid-path="${_pid_path}/${_pkgname}.pid" \
		--lock-path=${_pid_path}/${_pkgname}.lock \
		--http-client-body-temp-path=${_tmp_path}/client_body_temp \
		--http-proxy-temp-path=${_tmp_path}/proxy_temp \
		--http-fastcgi-temp-path=${_tmp_path}/fastcgi_temp \
		--http-uwsgi-temp-path=${_tmp_path}/uwsgi_temp \
		--http-scgi-temp-path=${_tmp_path}scgi_temp \
		--http-log-path=${_log_path}/access.log \
		--error-log-path=${_log_path}/error.log \
		--user=${_user} \
		--group=${_group} \
		--with-debug \
		--with-ipv6 \
		--with-imap \
		--with-imap_ssl_module \
		--with-http_ssl_module \
		--with-http_stub_status_module \
		--with-http_dav_module \
		--with-http_gzip_static_module \
		--with-http_realip_module \
		--with-http_addition_module \
		--with-http_xslt_module \
		--with-http_image_filter_module \
		--with-http_sub_module \
		--with-http_flv_module \
		--with-http_mp4_module \
		--with-http_random_index_module \
		--with-http_secure_link_module \
		--with-http_perl_module \
		--with-http_degradation_module \
		--add-module=../${_cachepurge_dirname} \
		--add-module=../${_echo_dirname} \
		--add-module=../${_headersmore_dirname} \
		--add-module=../${_slowfscache_dirname} \
		--add-module=../${_uploadprogess_dirname} \
		--add-module=../${_upstreamfair_dirname} 

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install

	sed -i -e "s/\<user\s\+\w\+;/user $_user;/g" $pkgdir/$_conf_path/conf/nginx.conf

	install -d "${pkgdir}/${_tmp_path}"
	install -d "${pkgdir}/${_doc_root}"

	mv "${pkgdir}/${_conf_path}/html/"* "${pkgdir}/${_doc_root}"
	rm -rf "${pkgdir}/${_conf_path}/html"

	install -D -m555 "${srcdir}/nginx.sh" "${pkgdir}/etc/rc.d/${_pkgname}"
	install -D -m644 "${srcdir}/nginx.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
	install -D -m644 "${srcdir}/nginx.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "man/nginx.8" "${pkgdir}/usr/share/man/man8/nginx.8"
}

