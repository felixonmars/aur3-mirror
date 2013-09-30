# Maintainer: dryes <joswiseman@gmail>
pkgname=pyrescene
pkgver=0.5.1
pkgrel=1
pkgdesc='Tools for backing up and restoring metadata from Rar files'
url='https://bitbucket.org/Gfy/pyrescene'
arch=('any')
license=('MIT')
depends=('python2' 'python2-numpy')
optdepends=(
  'chromaprint: Recreating MP3 and FLAC sample files'
  'unrar: Handling vobsub files'
)
conflicts=('awescript' 'rescene' 'resample')
provides=('awescript' 'rescene' 'resample')

source=(
  "https://bitbucket.org/Gfy/pyrescene/downloads/pyReScene-${pkgver}.zip")
sha256sums=(2dd8c0120e93ed12f4b513c64e9784c67e3cc77c60eb1fd03e8890b9a4430d08)

package() {
  cd "${srcdir}/pyReScene-${pkgver}"
  
  python2 'setup.py' install --root="${pkgdir}"

  sed -i -r 's|/usr/local/bin/sr([rs])|sr\1|ig' 'awescript/awescript.py'
  install -D -m755 "awescript/awescript.py" "${pkgdir}/usr/bin/awescript"
  
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
