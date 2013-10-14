# Maintainer : JabaDisa <admin at jabadisa dot com>

pkgname=xmind-bin
name=xmind-linux
pkgver=3.3.1.201212250029
pkgrel=1
pkgdesc="XMind is a powerful brainstorming and mind mapping software tool, based on the Eclipse platform."
arch=('i686' 'x86_64')
url="http://www.xmind.net/"
license=('EPL')
depends=('gtk2>=2.8.0' 'java-runtime>=6')
install="$name.install"

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='amd64'
  md5sums=('a31c55dab417a8281ec4211f4ac111d7')
elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i386'
  md5sums=('53d55f189879b4d2f27eb214456c754b')  
fi

source=("http://www.xmind.net/xmind/downloads/${name}-${pkgver}_${ARCH}.deb")

package() {
  # Extract DEB
  cd ${srcdir}
  tar -zxf ${srcdir}/data.tar.gz
  
  # Relocate files
  mkdir ${srcdir}/opt
  mv ${srcdir}/usr/local/xmind ${srcdir}/opt/xmind
  rm -r ${srcdir}/usr/local
  cp -r ${srcdir}/usr ${pkgdir}/
  cp -r ${srcdir}/opt ${pkgdir}/
  
  # Correct paths in .desktop file
  sed -i 's/\/usr\/local\/xmind/\/opt\/xmind/g' ${pkgdir}/usr/share/applications/xmind.desktop
  
  # Symlink binary to /usr/bin
  mkdir ${pkgdir}/usr/bin
  ln -s /opt/xmind/XMind ${pkgdir}/usr/bin/xmind
}
