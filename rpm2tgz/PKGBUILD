# Maintainer: Mark Pustjens <pustjens@dds.nl

pkgname=rpm2tgz
pkgver=1.2.2
pkgrel=2
pkgdesc="Convert a .rpm file to a .tar.gz archive"
url="http://www.slackware.com/config/packages.php"
arch=('any')
license=('as-is')
source=('ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/rpm2targz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/rpm2targz.README'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/rpmoffset.c'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0001-fix-d-handling.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0002-fix-spurious-path-to-rpm-file-with-n-option.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0003-allow-every-user-to-use-rpm2tgz.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0004-produce-more-compliant-slack-desc.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0005-gzip-man-info-pages.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0006-should-we-use-.txz-format-in-slackware-current.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0007-Add-support-for-.txz-packages-and-rpm2txz-symlink.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0008-Avoid-none-values-in-slack-desc.patch.gz'
	'ftp://ftp.slackware.com/pub/slackware/slackware_source/a/rpm2tgz/patches/0009-Add-c-option-just-as-makepkg-c-y.patch.gz')
depends=('cpio' 'tar' 'gzip')

build() {
	cd ${srcdir} || return 1

	# These are all against "rpm2tgz", so mv it until we are done patching:
	mv rpm2targz rpm2tgz
	zcat ${srcdir}/0001-fix-d-handling.patch.gz | patch -p1 || exit 1
	zcat ${srcdir}/0002-fix-spurious-path-to-rpm-file-with-n-option.patch.gz | patch -p1 || exit 1
	zcat ${srcdir}/0003-allow-every-user-to-use-rpm2tgz.patch.gz | patch -p1 || exit 1
	zcat ${srcdir}/0004-produce-more-compliant-slack-desc.patch.gz | patch -p1 || exit 1
	# Not applied.  Rationale:  We do not want to alter the files in the RPM.
	#zcat ${srcdir}/0005-gzip-man-info-pages.patch.gz | patch -p1 || exit 1
	# Not applied.  Rationale:  .tgz works with all versions of Slackware.
	# Translated RPMs may be targeting systems with no .txz support.
	#zcat ${srcdir}/0006-should-we-use-.txz-format-in-slackware-current.patch.gz | patch -p1 || exit 1
	# OK, I will take this version of the patch, as it doesn't change the
	# default behaviour of rpm2tgz.
	# mv the script back (wow, this is rather random ;-)
	mv rpm2tgz rpm2targz
	zcat ${srcdir}/0007-Add-support-for-.txz-packages-and-rpm2txz-symlink.patch.gz | patch -p1 || exit 1
	zcat ${srcdir}/0008-Avoid-none-values-in-slack-desc.patch.gz | patch -p1 || exit 1
	zcat ${srcdir}/0009-Add-c-option-just-as-makepkg-c-y.patch.gz | patch -p1 || exit 1


	install -m755 -d ${pkgdir}/usr/bin/ || return 1
	cc -o ${srcdir}/rpmoffset ${srcdir}/rpmoffset.c || return 1
	install -m755 ${srcdir}/rpmoffset ${pkgdir}/usr/bin/ || return 1
	install -m755 ${srcdir}/rpm2targz ${pkgdir}/usr/bin/ || return 1

	cd ${pkgdir}/usr/bin/ || return 1
	ln -s rpm2targz rpm2tgz || return 1
	ln -s rpm2targz rpm2txz || return 1

	install -m755 -d ${pkgdir}/usr/share/doc/rpm2targz || return 1
	install -m655 ${srcdir}/rpm2targz.README ${pkgdir}/usr/share/doc/rpm2targz/ || return 1
}

md5sums=('c8cae2fcf469c8cd4dfc9bb8bc0ef8a1'
         'ad7bad01db2cad6d8f8c305eae90488d'
         'e577bea9b99ebf559e40f8cada020730'
         'd3ba7c0f5488ac9e6ce7f471499645e6'
         'd6a425a78217a6e191a730ad53d4e83b'
         'cafbce9e5fc76c694abda7bcd1bb14d2'
         '4a79131ff38af9ce7e8a98a4313ba251'
         'cef76f3796a3438f3ed3e9277d7cdc4b'
         'ef5c08d660072da81ffd008dd70fcbf2'
         '3b4c3a77e4f9a4a724fba271623960e8'
         'eb185f032a0fcb146e969ba68717ac87'
         '0c27a0c11dc1835cb96a7257d1ab188e')
