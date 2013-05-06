# Maintainer: Nick Bair <njbair at gmail dot com>
pkgname=kpentrytemplates
pkgver=6.01
pkgrel=1
pkgdesc="KPEntryTemplates is a plugin for KeePass that is supposed to make it easier for KeePass to be used for storing additional sensitive data other than web logins and extend the templating system."
arch=('any')
url="http://sourceforge.net/projects/kpetemplates/"
license=('unknown')
source=("KPEntryTemplates-${pkgver}.zip::http://sourceforge.net/projects/kpetemplates/files/KPEntryTemplates-${pkgver}.zip/download")
md5sums=('548f657c89c8330d6813581f17038eb2')

package() {
  install -Dm644 "${srcdir}/KPEntryTemplates.plgx" "${pkgdir}/usr/share/keepass/KPEntryTemplates.plgx"
}

# vim:set ts=2 sw=2 et:
