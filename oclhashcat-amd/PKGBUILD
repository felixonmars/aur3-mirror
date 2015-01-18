# Maintainer: Vlad <avireti@gmail.com>
# Contributor: onny <onny@project-insanity.org>

pkgname=oclhashcat-amd
_pkgname=oclHashcat
pkgver=1.32
pkgrel=1
pkgdesc="Worlds fastest WPA cracker with dictionary mutation engine"
url=('http://hashcat.net/oclhashcat/')
arch=('i686' 'x86_64')
license=('custom')
optdepends=('catalyst-utils>=14.9: For gpu support via ATI Stream'
	    'opencl-catalyst>=14.9: For gpu support via ATI Stream')
source=("http://hashcat.net/files/${_pkgname}-${pkgver}.7z")
sha512sums=('4002d475b63c89b3bc303d10b02cf98cc670cda90d51e9a38b9b9bb5acb96c503a200566b620b8b0c1f29913e47744cbfc75245e0eabf7839a75cd4f02c3053b')
options=('!strip')

package() {
  find "${srcdir}/${_pkgname}-${pkgver}" \( -name "*.cmd" -o -name "*.exe" \) -print | xargs -i rm {}
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  if [ "${CARCH}" = "x86_64" ]; then
    rm ${srcdir}/${_pkgname}-${pkgver}/oclHashcat32.bin
    echo -e "#!/bin/bash\n/opt/${pkgname}/oclHashcat64.bin \$@" > $pkgdir/usr/bin/oclHashcat
    chmod a+x $pkgdir/usr/bin/oclHashcat
  else
    rm ${srcdir}/${_pkgname}-${pkgver}/oclHashcat64.bin
    echo -e "#!/bin/bash\n/opt/${pkgname}/oclHashcat32.bin \$@" > $pkgdir/usr/bin/oclHashcat
    chmod a+x $pkgdir/usr/bin/oclHashcat
  fi
  cp -rv "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
