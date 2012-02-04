# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=videothumbnail
pkgver=0.1.14
pkgrel=4
pkgdesc="Helper program for ROX-Filer that provides images for video files"
arch=('any')
url="http://www.kerofin.demon.co.uk/rox/VideoThumbnail.html"
license=('GPL2')
depends=('rox' 'rox-lib' 'mplayer')
install="videothumbnail.install"
source=("http://www.kerofin.demon.co.uk/rox/VideoThumbnail-${pkgver}.tar.gz")
md5sums=('f3d9a0e6f5bd431b33df1163a0b9e58c')

build() {
  cd "${srcdir}"

  # python2 fix
  sed -i "s|\(env python\).*|\12|" `grep -rl "env python" .`
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share"
  cp -a VideoThumbnail ${pkgdir}/usr/share

  # create a shellscript which is known in the PATH
  install -d "${pkgdir}/usr/bin"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/videothumbnail"
  echo "exec /usr/share/VideoThumbnail/AppRun \"\$@\"" >> "${pkgdir}/usr/bin/videothumbnail"
  chmod 755 "${pkgdir}/usr/bin/videothumbnail"
}
