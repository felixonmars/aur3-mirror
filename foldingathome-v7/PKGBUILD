# Contributor: paul2lv [at] gmail dot com
# Maintainer: 

pkgname=foldingathome-v7
pkgver=7.2.9
pkgrel=1
pkgdesc="Folding@Home is a distributed computing project which studies protein folding, misfolding, aggregation, and related diseases."
arch=('i686' 'x86_64')
url="http://folding.stanford.edu/"
license=('CUSTOM')
depends=('glibc')
install=foldingathome-v7.install

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

[ "$CARCH" = "i686" ] &&_source_arch="32bit"
[ "$CARCH" = "x86_64" ] && _source_arch="64bit"

if [ "$CARCH" = "i686" ]; then
    source=(https://fah-web.stanford.edu/file-releases/public/release/fahclient/debian-testing-32bit/v7.2/fahclient_7.2.9-32bit-release.tar.bz2 foldingathome-v7.rc.d foldingathome-v7.service)
    md5sums=('f8a0b43bfc4110f2200b689d8d788962' '50481b4e31edb24519e855d770955eda' 'fe7c7652443e72830cf6d641846c07f6')
     
elif [ "$CARCH" = "x86_64" ]; then
    source=(https://fah-web.stanford.edu/file-releases/public/release/fahclient/debian-testing-64bit/v7.2/fahclient_7.2.9-64bit-release.tar.bz2 foldingathome-v7.rc.d foldingathome-v7.service)
    md5sums=('d8d93d3436e5ebb52876c73cf375c9ac' '50481b4e31edb24519e855d770955eda' 'fe7c7652443e72830cf6d641846c07f6')
fi


build() {
  cd ${srcdir}

  install -D -c -m755 fahclient_${pkgver}-${_source_arch}-release/FAHClient ${pkgdir}/opt/fah-v7/FAHClient
  install -D -c -m755 fahclient_${pkgver}-${_source_arch}-release/FAHCoreWrapper ${pkgdir}/opt/fah-v7/FAHCoreWrapper
  install -D -c -m755 ${srcdir}/foldingathome-v7.rc.d ${pkgdir}/etc/rc.d/foldingathome-v7
  install -D -c -m755 fahclient_${pkgver}-${_source_arch}-release/sample-config.xml ${pkgdir}/opt/fah-v7/sample-config.xml

  chmod 755 ${pkgdir}/opt/fah-v7/FAHClient
  chmod 755 ${pkgdir}/opt/fah-v7/FAHCoreWrapper
  install -D -m644 fahclient_${pkgver}-${_source_arch}-release/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
  install -D -m644 fahclient_${pkgver}-${_source_arch}-release/README ${pkgdir}/opt/fah-v7/README
  install -D -m644 fahclient_${pkgver}-${_source_arch}-release/ChangeLog ${pkgdir}/opt/fah-v7/ChangeLog
  install -D -m644 ${srcdir}/foldingathome-v7.service ${pkgdir}/etc/systemd/system/foldingathome-v7.service
}

