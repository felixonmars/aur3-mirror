# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=brother-hl5250dn-cupswrapper
_pkgname=cupswrapperHL5250DN
pkgver=2.0.1
pkgrel=3
pkgdesc="Cups wrapper for HL-5250DN and compatible printers."
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("GPL2")
if [ $CARCH == "x86_64" ]; then
  depends=('cups' 'ghostscript' 'lib32-glibc' 'brother-hl5250dn-lpr')
else
  depends=('cups' 'ghostscript' 'glibc' 'brother-hl5250dn-lpr')
fi
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/$_pkgname-$pkgver-1.i386.rpm")
md5sums=('150dd7eb8642e37a7a0c27a78af73b5f')
noextract=("$_pkgname-$pkgver-1.i386.rpm")

build() {
        cd $srcdir
        rpmextract.sh "$_pkgname-$pkgver-1.i386.rpm"

        rm -f $_pkgname-$pkgver-1.i386.rpm

        mkdir -p usr/share/
        rm -rf usr/share/brother
        mv usr/local/Brother usr/share/brother
        rmdir usr/local

        sed -i 's|/usr/local/Brother|/usr/share/brother|g' \
	       `grep -lr '/usr/local/Brother' ./`
        sed -i 's|/etc/init.d|/etc/rc.d|' \
	       "usr/share/brother/cupswrapper/cupswrapperHL5250DN-2.0.1"

	tar -cpf - . | tar -xpf - -C $pkgdir
}
