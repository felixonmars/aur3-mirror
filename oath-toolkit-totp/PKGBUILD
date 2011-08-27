# Contributor: Christian Hesse <mail@earthworm.de>

pkgname=oath-toolkit-totp
pkgver=1.8.2
pkgrel=1
pkgdesc="The OATH Toolkit attempts to collect several tools that are useful when deploying technologies related to OATH"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/oath-toolkit/"
license=('GPL')
depends=(pam)
provides=(oath-toolkit)
conflicts=(oath-toolkit)
source=("http://download.savannah.gnu.org/releases/${pkgname%-totp}/${pkgname%-totp}-${pkgver}.tar.gz"
	"totp-usersfile.patch"
	"replay-totp.patch")

build() {
  cd "$srcdir/${pkgname%-totp}-${pkgver}"

  patch -Np1 < $srcdir/totp-usersfile.patch
#  patch -Np1 < $srcdir/replay-totp.patch

#  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-totp}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  # PAM doesn't look here anyway
  rm -rf $pkgdir/usr/lib/security

  install -D -m 755 pam_oath/.libs/pam_oath.so $pkgdir/lib/security/pam_oath.so

  # Install basic docs too
  install -D -m 644 pam_oath/README $pkgdir/usr/share/doc/oath-toolkit/PAM_README
  install -D -m 644 README $pkgdir/usr/share/doc/oath-toolkit/README
}

md5sums=('b7fde53266a054d546b791d22be646ed'
         '7628838acb10376bd8059f2f50ff25fa'
         'c1ff1dba4bf0bed8886b8bcdcd62b03f')
