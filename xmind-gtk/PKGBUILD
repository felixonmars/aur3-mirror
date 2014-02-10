# Maintainer : lembang <lembang@gmail.com>
# all credits goes to JabaDisa <admin@jabadisa.com>
# since i like to use xmind a lot, I noticed that this package is not always uptodate, just make it nicer 
# to keep them always up to date 

pkgname=xmind-gtk
name=xmind-linux-gtk
pkgver=3.4.1.201401221918
pkgrel=1
pkgdesc="XMind is a powerful brainstorming and mind mapping software tool, based on the Eclipse platform."
arch=('i686' 'x86_64')
url="http://www.xmind.net/"
license=('EPL')
depends=('gtk2>=2.8.0' 'java-runtime>=6')
install="$name.install"

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='amd64'
  md5sums=('d978756be7d672c8cc90db9062be041c')
elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i386'
  md5sums=('08e259c882f318336ede6595b7db685f')  
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
