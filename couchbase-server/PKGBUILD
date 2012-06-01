pkgname=couchbase-server
pkgver=1.8.0
pkgrel=1
pkgdesc="Eventually persistent dabase built off of memcached and couchdb"
url='http://www.couchbase.com/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('libvbucket>=1.8' 'libevent' 'couchbase-memcached' 'couchbase-memcached-engines' 'portsigar' 'moxi' 'couchdb')
source=("http://packages.couchbase.com/releases/1.8.0/${pkgname}_src-${pkgver}.tar.gz"
        "couchbase.sh"
        "couchbase.conf")
md5sums=('b0d7504fa4600d198f5c55b3944e244a'
         '80c8d952aa5ec2640f909c234f520760'
         '07c81eb41195a16d5705ce7fa1171098')

build() {
	cd "${srcdir}/${pkgname}_src/ns_server"

	# Properly check environment variables
	sed -i -e 's/false/"0"/' src/ns_bootstrap.erl

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}_src/ns_server"
	# The make install provided with couchbase is inflexible and cannot
	# conform to hier(7) provided on most (all?) systems
	# make DESTDIR="$pkgdir" install
	local bin_prefix="/usr"

	ns_server_libdir="${pkgdir}${bin_prefix}/lib/ns_server/erlang/lib/ns_server"
	erlwsh_libdir="${pkgdir}${bin_prefix}/lib/ns_server/erlang/lib/erlwsh"
	gen_smtp_libdir="${pkgdir}${bin_prefix}/lib/ns_server/erlang/lib/gen_smtp"
	mochiweb_libdir="${pkgdir}${bin_prefix}/lib/ns_server/erlang/lib/mochiweb"

	rm -rf "${ns_server_libdir}"

	install -d "${ns_server_libdir}/priv"
	cp -r ebin "${ns_server_libdir}"
	install -d "${ns_server_libdir}/priv/public/"{css,js}
	install -m644 priv/public/{favicon.ico,index.html} "${ns_server_libdir}/priv/public"
	install -m644 priv/public/css/* "${ns_server_libdir}/priv/public/css"
	install -m644 priv/public/js/* "${ns_server_libdir}/priv/public/js"
	install -d "${ns_server_libdir}/priv/public/images/"{no-preload,spinner,ui-theme}
	install -m644 priv/public/images/*.png "${ns_server_libdir}/priv/public/images"
	install -m644 priv/public/images/*.gif "${ns_server_libdir}/priv/public/images"
	install -m644 priv/public/images/no-preload/* "${ns_server_libdir}/priv/public/images/no-preload"
	install -m644 priv/public/images/spinner/* "${ns_server_libdir}/priv/public/images/spinner"
	install -m644 priv/public/images/ui-theme/* "${ns_server_libdir}/priv/public/images/ui-theme"

	# Manually set version if not present
	sed -i -e "/vsn/s/\[\]/\"${pkgver}\"/" "${ns_server_libdir}/ebin/ns_server.app"

	install -d "${erlwsh_libdir}"
	cp -r deps/erlwsh/ebin "${erlwsh_libdir}"
	cp -r deps/erlwsh/priv "${erlwsh_libdir}"

	install -d ${gen_smtp_libdir}
	cp -r deps/gen_smtp/ebin "${gen_smtp_libdir}"

	install -d "${mochiweb_libdir}"
	cp -r deps/mochiweb/ebin "${mochiweb_libdir}"

	install -Dm644 <(sed -e "s/@DATA_PREFIX@//g;s|\".*/etc|\"/etc|;s|@BIN_PREFIX@|${bin_prefix}|g" < etc/static_config.in) \
		"${pkgdir}/etc/couchbase/static_config"
	touch "${pkgdir}/etc/couchbase/config"
	install -m644 priv/init.sql "${pkgdir}/etc/couchbase"

	install -d "${pkgdir}/var/lib/couchbase/"{mnesia,logs}

	install -D <(sed -e "s/@PREFIX@\(\/etc\|\/var\)/\1/g;s|@PREFIX@|${bin_prefix}|g;s/DONT_START_COUCH=1/: \${DONT_START_COUCH:=1}/" < couchbase-server.sh.in) \
		"${pkgdir}${bin_prefix}/bin/couchbase-server"
	install -D <(sed -e "s|@PREFIX@|${bin_prefix}|g" < cbbrowse_logs.in) \
		"${pkgdir}${bin_prefix}/bin/cbbrowse_logs"

	install cbcollect_info "${pkgdir}${bin_prefix}/bin"
	install ebucketmigrator "${pkgdir}${bin_prefix}/bin"
	install scripts/cbdumpconfig.escript "${pkgdir}${bin_prefix}/bin"

	install -D "${srcdir}/couchbase.sh" "${pkgdir}/etc/rc.d/couchbase"
	install -D "${srcdir}/couchbase.conf" "${pkgdir}/etc/conf.d/couchbase"
}
