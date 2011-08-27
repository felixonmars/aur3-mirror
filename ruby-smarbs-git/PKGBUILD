# Maintainer: Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>

pkgname=ruby-smarbs-git
_pkgname="${pkgname:5:6}"
pkgver=20100523
pkgrel=1
pkgdesc="smarbs is a backup script written in ruby capable of doing intelligent and automated backups using rsync."
arch=("any")
url="http://smarbs.sourceforge.net"
license=("GPL")
depends=("rsync" "ruby" "coreutils")
makedepends=("rubygems")
optdepends=("ruby-gtk2: For status icon while backupping."
            "syslog-ng: For syslog functionality.")
conflicts=("${pkgname:0:11}")
provides=("${pkgname:0:11}")
source=()
md5sums=()

_gitroot="git://smarbs.git.sourceforge.net/gitroot/smarbs/smarbs"
_gitname="${_pkgname}"

build() {
  cd "${srcdir}"

  msg "Connecting to GIT server over HTTP..."
  if [[ -d "${_gitname}" ]]; then
    (cd "${_gitname}" && git pull origin)
    msg "The local repository was updated."
  else
    git clone "${_gitroot}" "${_gitname}"
    msg "The remote repository was cloned."
  fi
  msg "GIT sync done or server timeout."

  cd "${_pkgname}"
  rake gem

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "${pkgdir}${_gemdir}" \
    "${srcdir}/${_gitname}/pkg/${_pkgname}*.gem" -n "${pkgdir}/usr/bin"

  rm -rf "${srcdir}/${_pkgname}/pkg/"
}
# vim:set ts=2 sw=2 et:
