# Maintainer: Arthur Skowronek <eisensheng@mailbox.org>

pkgname=gog-dont-starve
pkgver=1.0.0.1
pkgrel=1
pkgdesc='Uncompromising wilderness survival game full of science and magic.'
arch=('i686' 'x86_64')
url='http://www.gog.com/game/dont_starve'
license=('Custom')
groups=('games')
depends=('librtmp0')
makedepends=()
optdepends=()
options=(!strip)
source=("gog://don_t_starve_${pkgver}.tar.gz")
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually"`
            `" download it to \"$(pwd)\", or set up a gog:// DLAGENT"`
            `" in /etc/makepkg.conf.; exit 1")
md5sums=('80cccf88d5c59c34bc50134898e3db61')
PKGEXT=.pkg.tar 


build() {
  cd "${srcdir}/Dont Starve"

  sed -r -i \
      's/(declare -r CURRENT_DIR="\$\( cd "\$\( dirname )'`
        `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
        `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
      "start.sh"

  if [[ $CARCH = x86_64 ]]; then
    rm -r "game/dontstarve32"
  elif [[ $CARCH = i686 ]]; then
    rm -r "game/dontstarve64"
  fi
}


package() {
  cd "${srcdir}/"
  
  mkdir -p "${pkgdir}/opt/gog/"
  cp -ar "Dont Starve" "${pkgdir}/opt/gog/dont-starve"

  cd "Dont Starve"
  install -Dm644 'docs/End User License Agreement.txt' \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "support/gog-dont-starve.png" \
    "${pkgdir}/usr/share/pixmaps/gog-dont-starve.png"
  install -Dm644 "support/gog-dont-starve-primary.desktop" \
    "${pkgdir}/usr/share/applications/gog-dont-starve-primary.desktop"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s '/opt/gog/dont-starve/start.sh' "${pkgdir}/usr/bin/gog-dont-starve"
}
