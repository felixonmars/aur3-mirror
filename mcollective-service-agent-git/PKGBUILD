pkgname=mcollective-service-agent-git
pkgver=3.1.2.d2ce464
pkgrel=1
pkgdesc="MCollective Agent to manage the OS Services"
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/mcollective-service-agent"
license=('GPL')
depends=('ruby' )
source=(git://github.com/puppetlabs/mcollective-service-agent.git)
sha1sums=('SKIP')

pkgver() {
  cd mcollective-service-agent
  version="$(grep -E '^\|[0-9]+\.[0-9]+\.[0-9]+\|' CHANGELOG.md | head -1 | cut -f2 -d\|)"
  githash="$(git log --oneline | head -1 | cut -f1 -d ' ')"
  echo "${version}.${githash}"
}

package() {
  cd mcollective-service-agent

  # Create directories
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/agent
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/application
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/data
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/util/service
  mkdir -p $pkgdir/usr/libexec/mcollective/mcollective/validator

  install agent/* $pkgdir/usr/libexec/mcollective/mcollective/agent
  install application/* $pkgdir/usr/libexec/mcollective/mcollective/application
  install data/* $pkgdir/usr/libexec/mcollective/mcollective/data
  install util/service/* $pkgdir/usr/libexec/mcollective/mcollective/util/service
  install validator/* $pkgdir/usr/libexec/mcollective/mcollective/validator
}
