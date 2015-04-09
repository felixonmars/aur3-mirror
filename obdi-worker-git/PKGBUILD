# Maintainer: Ruthger Gubbels <aur@ruthger.nl>

pkgname='obdi-worker-git'
pkgver=0.1.3
pkgrel=1
pkgdesc='Obdi is an extendable graphical user interface for running scripts on remote servers. (worker)'
arch=('x86_64')
url='https://github.com/mclarkson/obdi/'
license=('GPL3')
depends=(
  'go'
)
makedepends=('git')
backup=(
  etc/obdi-worker/obdi-worker.conf
  etc/obdi-worker/certs/cert.pem
  etc/obdi-worker/certs/key.pem
)
options=()
source=(
  'git://github.com/mclarkson/obdi.git'
  obdi-worker.service
  cert.pem
  key.pem
)
sha512sums=('SKIP'
            '50f4e863c8f65162ad46ee4736e7066c84bda747cf68a875ff8d79e156f022a7e359a2fc8fed73f8c2cf07e460959e679b16be50fa9c40373e35c45c595add8d'
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

  cd "$srcdir"/obdi/obdi-worker
  go build -o obdi-worker
}

package() {
  # Directories
  install -d -m 755 "$pkgdir"/etc/obdi-worker "$pkgdir"/var/cache/obdi
  install -d -m 700 "$pkgdir"/etc/obdi-worker/certs

  # Config
  install -D -m 644 "$srcdir"/obdi/conf/obdi-worker.conf "$pkgdir"/etc/obdi-worker/obdi-worker.conf

  # Example certificate
  install -D -m 600 cert.pem "$pkgdir"/etc/obdi-worker/certs/cert.pem
  install -D -m 600 key.pem "$pkgdir"/etc/obdi-worker/certs/key.pem
  
  # Obdi executables
  install -D -m 755 "$srcdir"/obdi/obdi-worker/obdi-worker "$pkgdir"/usr/bin/obdi-worker

  # SystemD Service
  install -D -m 644 obdi-worker.service "$pkgdir"/usr/lib/systemd/system/obdi-worker.service
}
