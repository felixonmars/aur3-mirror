# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname="sdfs"
pkgver=1.2.5
pkgrel=1
pkgdesc="An opensource deduplication filesystem implemented with FUSE. REQS:2G-RAM"
## Sorry pals it isn't compitable with 32bits
arch=(x86_64)
url="http://opendedup.org"
license=('GPL2')
depends=('java-environment=7' 'fuse>=2.8')
optdepends=('attr: For creating snapshots and regular attring')
source=("http://opendedup.googlecode.com/files/sdfs-${pkgver}.tar.gz"
	'launcher.sh')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/share"
  mkdir -p "${pkgdir}/usr/bin"

  cp -r sdfs-bin "${pkgdir}/usr/share/sdfs"

  for i in mkdse mkfs.sdfs mount.sdfs startDSEService.sh; do
    cp "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/${i}"
    sed "s|RUN_ME|${i}|" -i "${pkgdir}/usr/bin/${i}"
    chmod +x "${pkgdir}/usr/bin/${i}"
  done
}

md5sums=('b52a61ff91142c9ce6a8f8b6610b41cb'
         'c34b6f83dd31e623491d184813e0522d')
