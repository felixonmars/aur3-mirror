# Maintainer: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
pkgname=xampp
pkgver=1.8.3
pkgrel=2
pkgdesc="A free and open source cross-platform web server package (LAMP Stack), consisting mainly of the Apache HTTP Server, MySQL database, and interpreters for scripts written in the PHP and Perl programming languages"
url="http://www.apachefriends.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('net-tools')
makedepends=('proot')
[ "$CARCH" = "i686" ] && source=("http://sourceforge.net/projects/${pkgname}/files/XAMPP%20Linux/${pkgver}/${pkgname}-linux-${pkgver}-4-installer.run/download")
[ "$CARCH" = "x86_64" ] && source=("http://sourceforge.net/projects/${pkgname}/files/XAMPP%20Linux/${pkgver}/${pkgname}-linux-x64-${pkgver}-4-installer.run/download")
options=(!strip)
install=xampp.install
[ "$CARCH" = "i686" ] && md5sums=('7b3cc57700ac0c0aeae60d4e416d939e')
[ "$CARCH" = "x86_64" ] && md5sums=('b52322b5ba898825a4e521916bca31c8')


package() {
  install -dm755 "${pkgdir}/opt/lampp"

  msg "Extracting package to a chroot..."
  chmod +x "${srcdir}"/download
  echo "Y" | proot -b "${pkgdir}"/opt/lampp:/opt/lampp "${srcdir}"/download --mode text
  chmod g-s -R "${pkgdir}"/opt/lampp

  # licenses
  install -dm755 "${pkgdir}"/usr/share/licenses/xampp
  cp "${pkgdir}"/opt/lampp/licenses/* "${pkgdir}"/usr/share/licenses/xampp

  # /usr/bin executables
  install -dm755 "${pkgdir}"/usr/bin
  ln -sf /opt/lampp/lampp "${pkgdir}"/usr/bin/xampp
  ln -sf /opt/lampp/lampp "${pkgdir}"/usr/bin/lampp
}

