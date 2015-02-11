pkgname=docker-zfs
pkgver=1.4.1.dev.13116.c323cf0
pkgrel=1
epoch=1
pkgdesc='docker with experimental support for zfs (does not conflict with docker package)'
arch=('x86_64')
url="https://github.com/dotcloud/docker"
license=('Apache')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd' 'zfs-utils')
makedepends=('git' 'go' 'btrfs-progs')
backup=(etc/sysctl.d/docker-zfs.conf)
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=("git+https://github.com/Mic92/docker.git#branch=features/zfs-rebased"
        'docker.service'
        'docker.install'
        docker.conf
        )
install='docker.install'

pkgver() {
  cd "${srcdir}/docker"
  _dockerver="$(cat VERSION)"
  printf "%s.%s.%s" "${_dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd docker
  export AUTO_GOPATH=1
  ./hack/make.sh dynbinary
}

package() {
  cd docker
  _dockerver="$(cat VERSION)"
  install -Dm755 "bundles/$_dockerver/dynbinary/docker-$_dockerver" "$pkgdir/usr/bin/docker-zfs"
  install -Dm755 "bundles/$_dockerver/dynbinary/dockerinit-$_dockerver" "$pkgdir/usr/local/lib/docker/dockerinit"
  # completion
  install -Dm644 "contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker-zfs"
  install -Dm644 "contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker-zfs"
  # systemd
  install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/system/docker-zfs.service"
  install -Dm644 "$srcdir/docker.conf" "$pkgdir/etc/sysctl.d/docker-zfs.conf"
}
md5sums=('SKIP'
         '25dd8ecbc426b4fe445f2e4f21d596ef'
         '036e99617da7251fa643bf6679098b38'
         '9bce988683771fb8262197f2d8196202')
sha1sums=('SKIP'
          '50aebedb8a41721f796164346d33c3e922145af3'
          '63cff94180b47081d3de06ba449ebccb6abea8c8'
          '83848a9904e1588c3a6d340dcedf2d00fa1d382d')
sha256sums=('SKIP'
            '9af241df01d307777c1522391c568882657406b4b9fc2c1e60f69ca37c55f109'
            'dd16c81e99a4ef663f62e550ba329f816e28156aa43f0a72f16202fc4f8ebefd'
            '994346d92e0b887498755198e1fbe87e820260d4af9cd1cc4713ac9986f4b303')
