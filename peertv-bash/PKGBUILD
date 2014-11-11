# Maintainer: teraflops <cprieto.ortiz@gmail.com>
pkgname=peertv-bash
pkgver=0.0.1
pkgrel=1
pkgdesc="Command line tool for manage and play series from EZTV"
arch=('any')
url="https://gitorious.org/peertv/peertv-bash/"
license=('GPL3')
depends=('peerflix' 'mpv' 'sqlite' 'wget' 'sed')
makedepends=('git')
optdepends=('subliminal-git: subtitles support')
provides=('peertv')
source=('git://gitorious.org/peertv/peertv-bash.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/$pkgname"

install -Dm755 peertv "$pkgdir"/usr/bin/peertv
  install -Dm644 peertv.bash_completion "$pkgdir"/etc/bash_completion.d/peertv 
}

# vim:set ts=2 sw=2 et:
