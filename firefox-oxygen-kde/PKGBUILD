# Contributor: Florian Léger <florian6 dot leger at laposte dot net>
# Maintainer: Alois Nespor <info at aloisnespor dot info>

pkgname=firefox-oxygen-kde
pkgver=4.0_b3
pkgrel=1
pkgdesc="Complete add-on/theme bringing the Oxygen style for Firefox."
arch=(any)
depends=('firefox')
url="http://oxygenkde.altervista.org/index.html"
license=('GPL')
source=("http://oxygenkde.altervista.org/download/OxygenKDE_${pkgver//./_}.xpi")


package() {
  local f
  local emid
  local destdir

  cd "${srcdir}"

  for f in "oxykdeopt" "oxykdetheme"; do
    mkdir -p "${f}"
    bsdtar -xf "${f}.xpi" -C "${f}"
    emid="$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' "${f}/install.rdf")"
    sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>30.*</em:maxVersion>#' "${f}/install.rdf"
    dstdir="${pkgdir}/usr/lib/firefox/browser/extensions/${emid}"
    install -d "${dstdir}"
    pushd "${f}"
    find . -type f -exec install -Dm644 '{}' "${dstdir}/{}" \;
    popd
  done
}
sha256sums=('c75ad8fa2709712a6e0a70daccf2ac5a1e2b22a79f427bd9c576122bbd1d1939')
