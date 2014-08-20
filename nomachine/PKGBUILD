# Maintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>

pkgname=nomachine
pkgver=4.2.27
pkgrel=1
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2014 NoMachine S.à r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
install=nomachine.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('d814805c0dcadda258772642816cc46be2f7e653da8b8f6011bc65cc901d7224')
  _carch=_x86_64
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('85357c4da42e1bd3b45179bbe75748852084478dcdcddb5fe1a473658b78de77')
  _carch=_i686
fi
source=("http://download.nomachine.com/download/4.2/Linux/${pkgname}_${pkgver}_${pkgrel}${_carch}.tar.gz")

package()
{
  cd "${srcdir}"

  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}
