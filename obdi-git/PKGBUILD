# Maintainer: Ruthger Gubbels <aur@ruthger.nl>

pkgname='obdi-git'
pkgver=0.1.3
pkgrel=3
pkgdesc='Obdi is an extendable graphical user interface for running scripts on remote servers. (master)'
arch=('x86_64')
url='https://github.com/mclarkson/obdi/'
license=('GPL3')
depends=(
  'go'
  'git'
)
makedepends=('git')
backup=(
  etc/obdi/obdi.conf
  etc/obdi/certs/cert.pem
  etc/obdi/certs/key.pem
)
options=()
source=(
  'git://github.com/mclarkson/obdi.git'
  obdi.service
  cert.pem
  key.pem
)
sha512sums=('SKIP'
            'd0b21e03e7fdc629382ea983b0b64fb6cce8ad446fbac1cbc4b5d121a2e6ef18db20e6e496827b1c4a3e4a5458299e77bf2e955fbb74cc673678c96d279d1b5a'
            '4460bc7cd5f094aebfcfb0e0b0cd564ea360e6802bb9b6bccd57965a77f735cc09b12fe0011de2f61a38d6acb9f6438150e0dd899eff0208d7a606e1db128a23'
            'bbe8e707e3c413e155b30053e30e7df35f0d035a37654d87a92f128b0492fb4f314a0ec10225ab8396d4da8beb06af01aa7887def8f52362d99719228d54f2c8')

build() {
  # Include Golang binaries
  export PATH=$PATH:/usr/sbin:/usr/share/go/bin

  # Golang requirements
  export GOROOT=/usr/lib/go
  export GOPATH="$srcdir"/obdi

  # dirty github references hack
  mkdir -p "$srcdir"/obdi/src/github.com/mclarkson/obdi
  ln -s -f "$srcdir"/obdi/external "$srcdir"/obdi/src/github.com/mclarkson/obdi/external

  cd "$srcdir"/obdi/obdi
  go build -v -ldflags "-X main.VERSION $pkgver" -o obdi
  
}

package() {
  # Directories
  install -d -m 755 "$pkgdir"/etc/obdi "$pkgdir"/usr/share/obdi/static "$pkgdir"/var/lib/obdi/plugins/src "$pkgdir"/var/cache/obdi
  install -d -m 700 "$pkgdir"/etc/obdi/certs

  # Config
  sed -i 's/go_root = "\/usr\/local\/go"/go_root = "\/usr\/lib\/go"/' "$srcdir"/obdi/conf/obdi.conf
  install -D -m 644 "$srcdir"/obdi/conf/obdi.conf "$pkgdir"/etc/obdi/obdi.conf

  # Generate example certificate
  install -D -m 600 cert.pem "$pkgdir"/etc/obdi/certs/cert.pem
  install -D -m 600 key.pem "$pkgdir"/etc/obdi/certs/key.pem
  
  # Obdi executables
  install -D -m 755 "$srcdir"/obdi/obdi/obdi "$pkgdir"/usr/bin/obdi

  # SystemD Service
  install -D -m 644 obdi.service "$pkgdir"/usr/lib/systemd/system/obdi.service

  # static html files
  cp "$srcdir"/obdi/static/* "$pkgdir"/usr/share/obdi/static/ -r
}
