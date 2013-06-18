pkgname=mcollective-puppet-agent-git
pkgver=1.6.0.fb84c00
pkgrel=1
pkgdesc="MCollective Agent to manage the Puppet Agent"
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/mcollective-puppet-agent"
license=('GPL')
depends=('ruby' )
source=(git://github.com/puppetlabs/mcollective-puppet-agent.git)
sha1sums=('SKIP')

pkgver() {
  cd mcollective-puppet-agent
  version="$(grep -E '^\|[0-9]+\.[0-9]+\.[0-9]+\|' CHANGELOG.md | head -1 | cut -f2 -d\|)"
  githash="$(git log --oneline | head -1 | cut -f1 -d ' ')"
  echo "${version}.${githash}"
}

package() {
  cd mcollective-puppet-agent

  # Create directories
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/agent
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/aggregate
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/application
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/data
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/util
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/util/puppet_agent_mgr
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/util/puppet_agent_mgr/v2
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/util/puppet_agent_mgr/v3
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/validator

  install agent/* $pkgdir/usr/libexec/mcollective/mcollective/agent
  install aggregate/* $pkgdir/usr/libexec/mcollective/mcollective/aggregate
  install application/* $pkgdir/usr/libexec/mcollective/mcollective/application
  install data/* $pkgdir/usr/libexec/mcollective/mcollective/data
  install util/*.rb $pkgdir/usr/libexec/mcollective/mcollective/util
  install util/puppet_agent_mgr/*.rb $pkgdir/usr/libexec/mcollective/mcollective/util/puppet_agent_mgr
  install util/puppet_agent_mgr/v2/*.rb $pkgdir/usr/libexec/mcollective/mcollective/util/puppet_agent_mgr/v2
  install util/puppet_agent_mgr/v3/*.rb $pkgdir/usr/libexec/mcollective/mcollective/util/puppet_agent_mgr/v3
  install validator/* $pkgdir/usr/libexec/mcollective/mcollective/validator
}
