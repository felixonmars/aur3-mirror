# Maintainer: L <alaviss0 at gmail dot com>

pkgbase=gridcoinresearch-git
pkgname=('gridcoinresearch-daemon-git' 'gridcoinresearch-qt-git' 'gridcoinresearch-upgrader-git')
pkgver=3.3.9.5.r333.8d10d48
pkgrel=1
arch=('i686' 'x86_64')
url="http://gridcoin.us"
license=('custom:gridcoin')
makedepends=('boost' 'git' 'qt4' 'openssl' 'qrencode' 'db' 'gendesk' 'curl'
             'protobuf' 'miniupnpc')
source=('gridcoinresearch::git+https://github.com/gridcoin/Gridcoin-Research.git'
        'fix_icons.patch'         # Pull request #23
        'fix_upnp.patch'          # Pull request #12
        'fix_qrcode.patch'        # Pull request #13
        'fix_upgrader.patch'      # Pull request #19
        'fix_qaxcontainer.patch'  # Fix bug in Qt build
        'qm2ts.patch'
        'gridcoinresearch-qt.desktop')

sha1sums=('SKIP'
          'f387d27dd232ae8e45f12a1120b2bcf18884d204'
          '46006c634ef57189b9a9e6607ca392cb17b933b4'
          'd345a394388febc563b41e5090741c4e32e9b14c'
          '2a75fdcc0fa4d0b12570b5eb834f2974920ac04e'
          '4cedd67b668107111b4800f2a069a54c95796921'
          '9463c66ddfb93b2e8208430effde9de295f3c0cb'
          '931e82ce57cf9099d73534f969f49ba4e524e671')

pkgver() {
  cd "$srcdir/${pkgbase%-git}"

  printf "%s.r%s.%s" \
    "$(grep CLIENT_VERSION src/clientversion.h | awk '{print $NF}' | sed ':a;N;$!ba;s/\n/./g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgbase%-git}"

  mkdir -p src/obj/zerocoin
  chmod 755 src/leveldb/build_detect_platform

  for _fixes in {fix_{icons,upnp,qrcode,upgrader,qaxcontainer},qm2ts}; do
    patch -Np1 -i "${srcdir}"/${_fixes}.patch;
  done
}

build() {
  cd "$srcdir/${pkgbase%-git}"

  cd src
  make ${MAKEFLAGS} -f makefile.unix DEBUGFLAGS=""

  make ${MAKEFLAGS} -f makefile_upgrader.unix DEBUGFLAGS=""

  cd ..
  qmake-qt4 "USE_QRCODE=1"
  make ${MAKEFLAGS}
}

package_gridcoinresearch-daemon-git() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Daemon"
  depends=('boost-libs' 'libzip' 'miniupnpc' 'curl')
  optdepends=('boinc: [NECESSARY] used to build RAC')
  install=gridcoin.install

  cd "$srcdir/${pkgbase%-git}/src"
  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearch-qt-git() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Qt"
  depends=('boost-libs' 'qrencode' 'qt4' 'libzip' 'miniupnpc' 'curl')
  optdepends=('boinc: [NECESSARY] used to build RAC')
  install=gridcoin.install

  cd "$srcdir/${pkgbase%-git}"
  install -Dm755 gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"

  install -Dm644 "${srcdir}/gridcoinresearch-qt.desktop" "$pkgdir/usr/share/applications/gridcoinresearch-qt.desktop"

  install -Dm644 share/pixmaps/grc-small.png "$pkgdir/usr/share/pixmaps/grc-small.png"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearch-upgrader-git() {
  pkgdesc="Stub program for Gridcoin Daemon"
  depends=('curl' 'boost-libs' 'libzip')

  cd "${srcdir}/${pkgbase%-git}/src"
  install -Dm755 gridcoinupgrader "${pkgdir}/usr/bin/gridcoinupgrader"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
