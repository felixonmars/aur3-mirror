# Contributor: Sigma <sigma_g@melix.net>

pkgname=packet-flight
pkgver=20110124
pkgrel=1
pkgdesc="Visualizing packets"
arch=('any')
url="https://github.com/aristus/packet-flight/"
license=('BSD')
depends=('python2')
optdepends=('processing: to use the pde files produced')
makedepends=('git')
provides=('packet-flight')
source=()
md5sums=()

_gitroot="git://github.com/aristus/packet-flight.git"
_gitname="packet-flight"

build() {
  cd ${srcdir}

  msg "Connection au serveur GIT…"
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
  msg "Synchonisation avec le serveur GIT maitre finie, ou aucune réponse"

  cat > packet-flight-bin <<EOF
#\!/bin/sh
# Usage : packet-flight some_data.dump > data.pde
cat \$1 | python2 /usr/share/$pkgname/process-dump.py
EOF

}

package() {
  cd ${_gitname}
  msg `pwd`
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/${pkgname}
  install -m644 process-dump.py ${pkgdir}/usr/share/${pkgname}/
  install -m644 packet_flight/packet_flight.pde ${pkgdir}/usr/share/${pkgname}/packet_flight.pde
  install -m755 packet-flight-bin ${pkgdir}/usr/bin/packet-flight
}
