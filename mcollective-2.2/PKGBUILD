# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Alexander Baldeck <kth5@archlinuxppc.org>
_pkgname=mcollective
pkgname="${_pkgname}-2.2"
pkgver=2.2.4
pkgrel=1
pkgdesc="Framework to build server orchestration or parallel job execution systems"
arch=(any)
url="http://www.puppetlabs.com/mcollective/"
license=('APACHE')
depends=('ruby>=1.9' 'ruby-stomp' 'ruby-systemu')
source=("http://puppetlabs.com/downloads/${_pkgname}/${_pkgname}-${pkgver}.tgz"
        "${_pkgname}.service")
md5sums=('e66e42d4d97f089e5f4a003da802776f'
         'f227a0798be70a09abd096ae96058ecf')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm0755 bin/mcollectived "${pkgdir}/usr/bin/mcollectived"
  install -Dm0755 bin/mc-call-agent "${pkgdir}/usr/bin/mc-call-agent"
  install -Dm0755 bin/mco "${pkgdir}/usr/bin/mco"
  install -Dm0640 etc/server.cfg.dist "${pkgdir}/etc/mcollective/server.cfg"
  install -Dm0644 etc/client.cfg.dist "${pkgdir}/etc/mcollective/client.cfg"
  install -Dm0644 etc/facts.yaml.dist "${pkgdir}/etc/mcollective/facts.yaml"
  install -Dm0644 etc/rpc-help.erb "${pkgdir}/etc/mcollective/rpc-help.erb"
  
  install -Dm0644 "${srcdir}/mcollective.service" "${pkgdir}/usr/lib/systemd/system/mcollective.service"

  install -dm0755 "${pkgdir}/usr/lib/ruby/site_ruby"
  install -dm0755 "${pkgdir}/usr/libexec/mcollective"
  cp -r lib/* "${pkgdir}/usr/lib/ruby/site_ruby"
  cp -r plugins/* "${pkgdir}/usr/libexec/mcollective"
}

# vim:set ts=2 sw=2 et:
