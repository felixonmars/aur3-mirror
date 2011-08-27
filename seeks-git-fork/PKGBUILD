# Maintainer: Reventlov <nontunauraspasmonmail@gmail.com>

pkgname=seeks-git-fork
pkgver=20110731
pkgrel=3
pkgdesc="An Open Decentralized Platform for Collaborative Search, Filtering and content Curation. (with daemon, manpages and image-websearch-plugin)"
arch=('i686' 'x86_64')
url="http://www.seeks-project.info"
license=('custom:"AGPL3"')
depends=('pcre' 'curl' 'libxml2' 'libevent' 'protobuf' 'tokyocabinet' 'opencv' 'icu')
makedepends=('docbook2x' 'git' 'pkg-config')
conflicts=('seeks' 'seeks-last')
source=('img_websearch.patch'
		'docbook2man.patch'
		'seeksdaemon'
		'seeks.conf.d')
md5sums=('3f0178a6928c37cf3beeee02e3cd57d3'
         'f568d26877f9f7029794d6bc34911986'
         '7bf790955b49498c6e97fcc61ed22720'
         '0ce52c76122d086ed1311679626b7678')
install=seeks.install
_gitroot="git://seeks.git.sourceforge.net/gitroot/seeks/seeks"
_gitname="seeks"

build() {
	msg "Connecting to the GIT server...."

		if [[ -d ${srcdir}/${_gitname} ]] ; then
			cd $srcdir/${_gitname}
	git pull origin
		msg "The local files are updated..."
		else
			git clone ${_gitroot}
	fi

		msg "GIT checkout done."
		cd $srcdir

		msg "Start patching..."
		#Changing #include <cxflann.h> to #include <cv.h> (opencv)
		patch -p0 < "$srcdir/img_websearch.patch"

		msg "Start configurating..."
		cd $srcdir/$_gitname
		./autogen.sh
		cd $srcdir

		msg "Start patching..."
		#Changing docbook2xman to docbook2man
		patch -p0 < "$srcdir/docbook2man.patch"

		msg "Start making..."
		cd $srcdir/$_gitname
		./configure --prefix=/usr --sysconfdir=/etc --enable-httpserv-plugin --enable-image-websearch-plugin=yes
		sed -i s/-Wl,--as-needed// config.status
		make $MAKEFLAGS
}

package() {
		cd "$srcdir/$_gitname"
		make DESTDIR="$pkgdir" install
		mkdir -p $pkgdir/usr/share/licenses/seeks && cp COPYING $pkgdir/usr/share/licenses/seeks
		install -D -m644 Licenses  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
		install -D -m644 AGPL-3.txt  "${pkgdir}/usr/share/licenses/${pkgname}/"
		install -D -m644 BSD-yui.txt  "${pkgdir}/usr/share/licenses/${pkgname}/"
		install -D -m755  $srcdir/seeksdaemon  "${pkgdir}"/etc/rc.d/seeks
		install -D -m644  $srcdir/seeks.conf.d "${pkgdir}"/etc/conf.d/seeks
		install -D -m644 "${pkgdir}"/etc/seeks/cf-config "${pkgdir}"/usr/share/seeks/config/cf-config.example
		install -D -m644 "${pkgdir}"/etc/seeks/config "${pkgdir}"/usr/share/seeks/config/config.example
		install -D -m644 "${pkgdir}"/etc/seeks/httpserv-config "${pkgdir}"/usr/share/seeks/config/httpserv-config.example
		install -D -m644 "${pkgdir}"/etc/seeks/img-websearch-config "${pkgdir}"/usr/share/seeks/config/img-websearch-config.example
		install -D -m644 "${pkgdir}"/etc/seeks/lsh-config "${pkgdir}"/usr/share/seeks/config/lsh-config.example
		install -D -m644 "${pkgdir}"/etc/seeks/query-capture-config "${pkgdir}"/usr/share/seeks/config/query-capture-config.example
		install -D -m644 "${pkgdir}"/etc/seeks/uri-capture-config "${pkgdir}"/usr/share/seeks/config/uri-capture-config.example
		install -D -m644 "${pkgdir}"/etc/seeks/websearch-config "${pkgdir}"/usr/share/seeks/config/websearch-config.example
		rm "${pkgdir}"/etc/seeks/*config
}
