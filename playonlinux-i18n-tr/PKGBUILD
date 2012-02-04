# Contributor: Ertuğrul HAZAR <ertugrulhazar at gmail dot com>
pkgname=playonlinux-i18n-tr
pkgver=3.6
pkgrel=2
_language=tr
pkgdesc="Turkish language pack for PlayOnLinux"
arch=('i686' 'x86_64')
url="http://www.playonlinux.com"
license=('GPLv3')
depends=("playonlinux>=${pkgver}")
source=('http://svn.pardus.org.tr/contrib/2009/stable/hardware/emulator/playonlinux/files/turkish.patch')
md5sums=('1b06fe9f8944db0a4489a872d244dfa5')

build() {
  cd ${startdir}
  sed -i 's/^+//' turkish.patch
  sed -i '1,3s/ */# /' turkish.patch
  msgfmt turkish.patch > pol.mo
  mkdir -p ${startdir}/pkg//usr/share/playonlinux/lang/locale/tr/LC_MESSAGES/
  install -D -m 644 messages.mo ${startdir}/pkg/usr/share/playonlinux/lang/locale/tr/LC_MESSAGES/pol.mo
  mkdir -p ${startdir}/pkg/usr/share/playonlinux/lang/po/
  install -D -m 644 turkish.patch ${startdir}/pkg//usr/share/playonlinux/lang/po/${_language}.po
}
