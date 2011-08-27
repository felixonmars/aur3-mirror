# Maintainer: Soup <soup a.t soultrap d.o.t n.e.t>

pkgname=localepurge-jasl
pkgver=0.5.3.3
pkgrel=5
pkgdesc='Script to recover diskspace wasted for unneeded locale files and localized man pages.'
arch=('any')
url='http://packages.gentoo.org/package/app-admin/localepurge'
license=('GPL2')
conflicts=('localepurge')
provides=('localepurge')
backup=('etc/locale.nopurge')
source=("http://mirror.its.uidaho.edu/pub/gentoo/distfiles/localepurge-${pkgver}.tbz2"
        'archification-but-preserve-author.patch'
        'extra-locales-21-09-2010.patch')
md5sums=('6f48b5d789a13152d4fd785fe6cb2759'
         '3155922b930406deeab228c3aca5c0bc'
         '798742cf64b1d83b4f2ad7563a6326f3')

build() {
  cd $srcdir/localepurge || return 1
  patch -p0 < ${srcdir}/archification-but-preserve-author.patch || return 1
  patch -p0 < ${srcdir}/extra-locales-21-09-2010.patch || return 1
  install -D -m644 defaultlist ${pkgdir}/var/cache/localepurge/defaultlist || return 1
  install -D -m644 locale.nopurge ${pkgdir}/etc/locale.nopurge || return 1
  install -D -m744 localepurge ${pkgdir}/usr/sbin/localepurge || return 1
  install -D -m644 localepurge.8 ${pkgdir}/usr/share/man/man8/localepurge.8 || return 1
  cd ${pkgdir}/var/cache/localepurge/ || return 1
  ln -s defaultlist localelist || return 1
}
