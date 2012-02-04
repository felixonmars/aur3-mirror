# Contributor: David Couzelis <drcouzelis@gmail.com>

pkgname=ipset-init
pkgver=1
pkgrel=1
pkgdesc='A script to assist with loading the ipset administration tool for IP sets'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://ipset.netfilter.org'
depends=('ipset')
source=(ipset
        ipset.rules
        ipset.conf.d)
backup=(etc/conf.d/ipset)
md5sums=('79ca412fda09c1767c581be4500e7221'
         '9e331ddb448714840999f5985aa3b24f'
         '291c799b78558cc3cc5a37a145dd0c74')

package() {
  cd "${srcdir}"
  install -D -m755 ipset "${pkgdir}"/etc/rc.d/ipset
  install -D -m644 ipset.rules "${pkgdir}"/etc/ipset/ipset.rules
  install -D -m644 ipset.conf.d "${pkgdir}"/etc/conf.d/ipset
}
