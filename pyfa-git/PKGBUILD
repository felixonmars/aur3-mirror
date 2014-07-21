# Maintainer: Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

# Found typos, bugs or other problems? Feel free to create a pull-request:
# https://github.com/Nothing4You/PKGBUILDs

pkgname=pyfa-git
pkgver=1.2.1.r11.g009956c
pkgrel=1
epoch=2
pkgdesc="EVE Online Fitting Assistant"
arch=('i686' 'x86_64')
url="https://github.com/DarkFenX/Pyfa"
license=('GPL')
depends=('python2' 'wxpython2.8' 'python2-sqlalchemy' 'python2-numpy' 'python2-dateutil') # 'wxmathplot')
conflicts=('pyfa' 'pyfa2-git')
source=("pyfa.desktop" "pyfa-icon.png" "pyfa-start.sh" "pyfa::git://github.com/DarkFenX/Pyfa.git")

sha256sums=('cd3f5a0c6f6b99bfdb3677121e01f123503b09013dfe228c55d8208420d15a34'
            'ec26cd27496bede280430031bf07d4c44819f9b607701d0775186b5ae456703b'
            'acedf6df25fc47ebfa5ee4be0bc3c1bd6c2dd820886bd4534e34ec95d4c19789'
            'SKIP')
sha512sums=('5e850d60d8356c8de0f57c7afa40f1a5697da3f268b93abb32b5a78037825790483fa68928e2d020caeb3914cac5e0f790eecd47de557e4918c3cce753b75042'
            '97d2fbe316124d7847b20049d5438bf7876a52866128f72d68399ca7e0a6484f27646567d8d8dc07c370e938fdbad19d400737cdecfe265738d14c2f36460e31'
            '38d8a36dbd064e4e75b63101aaddcd45002af42409dfb8ee10af13db117ed6605bebee4c374781014b7c09cc03652ecc0f71df4f67c7572de8eb197601a8d517'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-*}"

  install -d "${pkgdir}/usr/share/pyfa"

  cp -a "${srcdir}/pyfa/" "$pkgdir/usr/share/"

  install -Dm644 "${srcdir}"/pyfa.desktop "${pkgdir}"/usr/share/applications/pyfa.desktop
  install -Dm644 "${srcdir}"/pyfa-icon.png "${pkgdir}"/usr/share/pixmaps/pyfa.png

  install -Dm755 "${srcdir}"/pyfa-start.sh "${pkgdir}"/usr/bin/pyfa
}
