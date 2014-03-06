pkgname=zeppelin-jsonrpc-remote-git

pkgver=0.33.g13777f6
pkgrel=1
pkgdesc="JSON RPC plugin for zeppelin media server."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/giszo/zeppelin-jsonrpc-remote"
license=('GPL3')

depends=('zeppelin-git'
         'zeppelin-http-server-git'
         )

makedepends=('scons' 'git')

source=("git://github.com/giszo/zeppelin-jsonrpc-remote")

md5sums=('SKIP')

pkgver() #
{
  cd "${srcdir}/zeppelin-jsonrpc-remote"
  # git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  echo 0.`git rev-list --count HEAD`.g`git rev-parse --short HEAD`
}

build() #
{
  cd "${srcdir}/zeppelin-jsonrpc-remote"
  scons
}

package() #
{
  cd "${srcdir}/zeppelin-jsonrpc-remote"
  mkdir -pv ${pkgdir}/usr
  scons install PREFIX=${pkgdir}/usr
}
