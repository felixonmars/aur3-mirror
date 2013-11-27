# $Id: 1b4a5077cd82f3be29a30bee505d9bc053835bfc $
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Marcel Wysocki <maci@satgnu.net>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#
# TODO: FIXME: I still need to go through this PKGBUILD and clean up a few
# things.  I just adopted it today, so please bear with me. [31 Oct 2013]
#
# TODO: [31 Oct 2013]
# - change build to use hack/make.sh or hack/makedist.sh or similar, and
#   insert version into binary appropriately.
# - switch to sha512sums.
# - change pkgver() to use git describe and tags.

pkgname=lxc-docker-git
pkgver=0.7.0.dev.4685.06d5e25
pkgrel=1
pkgdesc="Docker - the Linux container runtime - devmapper version"
arch=('x86_64')
url="https://github.com/dotcloud/docker"
license=('Apache License 2.0')
depends=('bridge-utils' 'iproute2' 'go>=1.1' 'lxc' 'device-mapper')
makedepends=('git' 'go>=1.1' 'python2-sphinx' 'python2-sphinxcontrib-httpdomain2' 'device-mapper')
provides=('lxc-docker')
install='docker.install'
source=(
    'docker::git+https://github.com/dotcloud/docker.git'
    'docker.service'
    'docker.sysctl'
    'docker.install'
)
conflicts=('lxc-docker')
replaces=('dotcloud-docker-git')
sha512sums=(
  'SKIP'
  '22263e73659e5aee6de760a670a9a1808f9e00a5e9a315c166eba40f88e1fa8596e1cace50b8463ea996f3a6a6567320c9b9e16f1c711b3b0b76c19011d9c1e6'
  'bf2fc17d038d392c87ef4ee49f3251ad753b98cf01996153bd8b161db06c3b295f3022985cda003c3567195f5be58e78deffa599d97dab4f74aa9cf201f79310'
  '75421cf8a4d46e53126e93011d44ef97cc7de58c9bfe53edb5e28bd8de779f4232aad28381f217b8cd6ec3cb1442ec250608a365ca9a4a2ce352db16d4beec9e'
)
epoch=2

pkgver() {
  cd "${srcdir}/docker"
  local dockerver
  dockerver="$(cat ${srcdir}/docker/VERSION)" 
  printf "%s.%s.%s" "${dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  export GOPATH=$(readlink -f ..):$(readlink -f ..)/src/github.com/dotcloud/docker/vendor
  
  rm -Rf github.com
  mkdir -p github.com/dotcloud
  mv docker github.com/dotcloud/

  pushd github.com/dotcloud/docker
  ./hack/make.sh dynbinary
  popd
  dockerver=$(cat github.com/dotcloud/docker/VERSION)
  cp github.com/dotcloud/docker/bundles/$dockerver/dynbinary/docker-$dockerver docker
  cp github.com/dotcloud/docker/bundles/$dockerver/dynbinary/dockerinit-$dockerver dockerinit

#manpage build fails due to sphinx bug 
#so we build html help for now
#https://bitbucket.org/birkenfeld/sphinx/issue/1281/sphinx-113-not-build-proper-manpages  
  pushd github.com/dotcloud/docker/docs
  make docs SPHINXBUILD=sphinx-build2 PYTHON=python2
#  make docs SPHINXBUILD=sphinx-build2 PYTHON=python2 man
  popd
}

package() {
  # install systemd service unit
  install -D -m 644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/system/docker.service"
  
  # install sysctl config
  install -D -m 644 "docker.sysctl" "$pkgdir/etc/sysctl.d/docker.conf"

  # install docker binaries
  install -D -m 755 "$srcdir/docker" "$pkgdir/usr/bin/docker"
  mkdir -p "$pkgdir/usr/libexec/docker"
  install -D -m 755 "$srcdir/dockerinit" "$pkgdir/usr/libexec/docker/dockerinit"

  install -D -m 644 "github.com/dotcloud/docker/contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
  
#  install -D -m 644 "github.com/dotcloud/docker/docs/_build/html" "$pkgdir/usr/share/doc/docker"
  mkdir -p "$pkgdir/usr/share/doc" 
  cp -a "github.com/dotcloud/docker/docs/_build/html" "$pkgdir/usr/share/doc/docker"
  
  curl https://raw.github.com/felixr/docker-zsh-completion/master/_docker > docker.zsh
  install -D -m 644 "docker.zsh" "$pkgdir/usr/share/zsh/site-functions/_docker"

}
