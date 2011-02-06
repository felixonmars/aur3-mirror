# Contributor: Glenn Matthys <glenn@webmind.be>
pkgname=nanoweb
pkgdesc="Nanoweb is an HTTP server written in PHP, designed to be small, secure, and extensible"
pkgver=2.2.9
pkgrel=1
license="GPL"
arch=(
	'i686'
	'x86_64'
)
url="http://nanoweb.si.kz/"
source=(
	${url}/downloads/dist/${pkgname}_${pkgver}.tgz
	conf.nanoweb
	rc.nanoweb
)
md5sums=(
	'3207919258d6a75b11214dc8eb747939'
	'7ad058bc4b43e34c3beff9270a397bd9'
	'4cc38c27ad962f69668aa9d2075c97bf'
)
depends=(php)
backup=(
	etc/nanoweb/default.theme
	etc/nanoweb/fancy.theme
	etc/nanoweb/mime.types
	etc/nanoweb/modules-win.conf
	etc/nanoweb/modules.conf
	etc/nanoweb/nanoweb-win.conf
	etc/nanoweb/nanoweb.conf
	etc/nanoweb/nanoweb.theme
	etc/nanoweb/vhosts-win.conf
	etc/nanoweb/vhosts.conf
)

build() {
	mkdir -p $startdir/pkg/etc/nanoweb
	mkdir -p $startdir/pkg/usr/lib/nanoweb/icons
	mkdir -p $startdir/pkg/usr/lib/nanoweb/modules
	mkdir -p $startdir/pkg/usr/share/doc/nanoweb
	mkdir -p $startdir/pkg/usr/share/man

	cd ${startdir}/src/${pkgname}_${pkgver}

	cp		conf/*			${startdir}/pkg/etc/nanoweb/
	cp		www/icons/*		${startdir}/pkg/usr/lib/nanoweb/icons/
	cp		modules/*.php	${startdir}/pkg/usr/lib/nanoweb/modules/
	cp	-R	docs/manual		${startdir}/pkg/usr/share/doc/nanoweb/
	cp		docs/README.*	${startdir}/pkg/usr/share/doc/nanoweb/
	cp	-R	docs/man/*		${startdir}/pkg/usr/share/man/

	install -D -m755 src/nanoctl		${startdir}/pkg/usr/sbin/nanoctl
	install -D -m755 src/nanoweb.php	${startdir}/pkg/usr/sbin/nanoweb.php
	install -D -m755 src/htpasswd.php	${startdir}/pkg/usr/sbin/htpasswd.php

	# initscripts
	install -D -m644 ${startdir}/src/conf.nanoweb	${startdir}/pkg/etc/conf.d/nanoweb
	install -D -m755 ${startdir}/src/rc.nanoweb		${startdir}/pkg/etc/rc.d/nanoweb

	# Correct path to php
	sed -i 's,#!/usr/local/bin/php,#!/usr/bin/php,g' $startdir/pkg/usr/sbin/nanoweb.php
	sed -i 's,#!/usr/local/bin/php,#!/usr/bin/php,g' $startdir/pkg/usr/sbin/htpasswd.php
}