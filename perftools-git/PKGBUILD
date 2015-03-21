# Maintainer: Augusto Hack <hack.augusto@gmail.com>
pkgname=perftools-git
pkgver=0.1
pkgrel=2
pkgdesc="Performance analysis tools based on Linux perf_events (aka perf) and ftrace"
arch=('any')
url="https://github.com/brendangregg/perf-tools"
license=('GPL')
depends=('bash' 'perl' 'procps-ng' 'awk' 'grep')
makedepends=('git')
optdepends=('perf')

_gitroot='https://github.com/brendangregg/perf-tools.git'
_gitname=perftools

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  scripts=(
    execsnoop iolatency iosnoop killsnoop opensnoop syscount
    disk/bitesize
    fs/cachestat
    kernel/funccount kernel/funcgraph kernel/funcslower kernel/functrace kernel/kprobe
    misc/perf-stat-hist
    net/tcpretrans
    system/tpoint
    tools/reset-ftrace
  )

  for script in ${scripts[@]}; do
    install -D -p -m 755 -t "$pkgdir/usr/bin" $script
  done

  mkdir -p "$pkgdir/usr/share/man/man8"
  find man/man8/ -type f | while read manual; do
    echo $manual
    gzip -c $manual > "$pkgdir/usr/share/${manual}.gz"
  done
}

# vim:set ts=2 sw=2 et:
