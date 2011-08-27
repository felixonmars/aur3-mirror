pkgname=ntpdate-dev
pkgver=4.2.7p23
pkgrel=1
pkgdesc="Client for the network time protocol. Development version"
arch=("i686" "x86_64")
conflicts=("ntp" "ntpdate")
license=('custom')
url="http://www.ntp.org/"
backup=("conf.d/ntp-client.conf")
source=("http://archive.ntp.org/ntp4/ntp-dev/ntp-dev-${pkgver}.tar.gz"
        "ntp-client.conf"
        "ntpdate")
options=('!emptydirs')
md5sums=('f006ea04f6f32a8f06684bc4bb36440f'
         'c7f50632b69bd4f32cf052d0b1848463'
         '140855352baeb89da0c6c1c475c18b57')
build() {
cd "${srcdir}"/ntp-dev-$pkgver || return 1

# configure
ac_cv_header_dns_sd_h=0 ./configure --prefix=/usr \
--enable-ignore-dns-errors|| return 1

# build and install
cd ntpdate
make || return 1
make DESTDIR="${pkgdir}" install || return 1

# install launch scripts 
mkdir -p "${pkgdir}"/etc/rc.d || return 1
install -D -m755 "${srcdir}"/ntpdate "${pkgdir}"/etc/rc.d/ || return 1

# install man pages
mkdir -p "${pkgdir}"/usr/share/man/man1/ 
find "${srcdir}"/ntp-dev-$pkgver -iname "*.1" \
-exec install -D -m644 {} \
"${pkgdir}"/usr/share/man/man1/ \; || return 1

# install sample configs
install -D -m644 $startdir/ntp-client.conf \
"${pkgdir}"/etc/conf.d/ntp-client.conf || return 1

install -Dm644 "${srcdir}"/ntp-dev-$pkgver/COPYRIGHT "${pkgdir}"/usr/share/licenses/ntpdate/COPYRIGHT
}
