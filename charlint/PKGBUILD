# Contributor: bender02 at archlinux dot us
pkgname=charlint
pkgver=0.55
_cvs_revision=1.28
pkgrel=1
pkgdesc="A Character Normalization Tool (for unicode)"
url="http://www.w3.org/International/charlint/"
license=("custom")
arch=('any')
depends=('perl>=5.8')
source=('charlint.pl::http://dev.w3.org/cvsweb/~checkout~/charlint/charlint.pl?rev=${_cvs_revision}&content-type=text/plain&only_with_tag=HEAD' \
        'ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt' \
        'LICENSE')
md5sums=('5e23227ba5b1ad7983679f0aec95ac79'
         'f5338142b5dd42c577fe7a6daed1cf4b'
         'dec58503d629e4739bb8cd0e11ee020d')

build() {
  cd $srcdir
  # change the default location (cwd) of UnicodeData file
  sed -i 's|ReadCharacterDataFile("UnicodeData\.txt");|ReadCharacterDataFile("/usr/share/charlint/UnicodeData\.txt");|' charlint.pl
}

package() {
  cd $srcdir
  install -m755 -D charlint.pl $pkgdir/usr/bin/charlint.pl
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/charlint/LICENSE
  install -m644 -D UnicodeData.txt $pkgdir/usr/share/charlint/UnicodeData.txt
}
