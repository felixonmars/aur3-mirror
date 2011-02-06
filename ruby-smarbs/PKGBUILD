# Maintainer: Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>

pkgname=ruby-smarbs
_pkgname="${pkgname#ruby-}"
pkgver=0.9.4
pkgrel=1
pkgdesc="smarbs is a backup script written in ruby capable of doing intelligent and automated backups using rsync."
arch=("any")
url="http://smarbs.sourceforge.net"
license=("GPL")
depends=("rsync" "ruby" "coreutils")
makedepends=("rubygems")
optdepends=("ruby-gtk2: For status icon while backupping."
            "syslog-ng: For syslog functionality.")
source=("http://gems.rubyforge.org/gems/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
md5sums=("3619dd66feb067824a74188047b1ab8f")

build() {
  cd "${srcdir}"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "${pkgdir}${_gemdir}" "${_pkgname}-${pkgver}.gem" \
  -n "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et:
