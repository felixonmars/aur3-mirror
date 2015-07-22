# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname='gss-ntlmssp'
pkgver=0.6.0.r6.gb7ff40d
_pkgtag="commit=b7ff40d4e30e1ee79684abe3c76b781a0c21dc57"
pkgrel=1
pkgdesc="GSSAPI mechanism plugin for NTLMSSP, NTLM, NTLMv2"
url="https://fedorahosted.org/$pkgname/"
arch=(i686 x86_64)
license=(GPL3)
source=("git://git.fedorahosted.org/git/$pkgname.git#$_pkgtag")
sha256sums=('SKIP')
options=(!emptydirs)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p m4 # optional, but quiets a warning
  autoreconf -f -i
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
  sed -i 's:\${exec_prefix}:/usr:' examples/mech.ntlmssp
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  doc="$pkgdir/usr/share/doc/pkgname"
  install -Dm0644 README.txt \
                  "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm0644 examples/mech.ntlmssp \
                  "$pkgdir/usr/share/doc/$pkgname/mech.d-ntlmssp.conf"
  install -Dm0644 examples/mech.ntlmssp \
                  "$pkgdir/etc/gss/mech.d/ntlmssp.conf"
}

# vim: ts=2:sw=2:et:nowrap
