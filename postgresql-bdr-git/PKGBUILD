# Maintainer: James Pic <jpic@yourlabs.org>
# Fork of postgresql-git:
# Author: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=postgresql-bdr-git
pkgver=20150308
pkgrel=7
_majorver=9.4
pkgdesc="Beta version of the PostgreSQL database with BDR patches"
arch=('i686' 'x86_64')
url="http://www.postgresql.org/developer/alpha"
license=('custom:PostgreSQL')
backup=('etc/conf.d/postgresql' 'etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
options=(!strip) # to facilitate debugging of testing builds
depends=('libxml2' 'readline>=6.0' 'openssl>=1.0.0' 'glibc>=2.21')
makedepends=('python2' 'perl' 'git')
optdepends=('python2: for PL/Python support'
            'perl: for PL/Perl support')
conflicts=('postgresql-libs' 'postgresql' 'postgresql-testing' 'postgresql-git')
provides=("postgresql-libs=$_ver" "postgresql=$_ver")
source=(postgresql-run-socket.patch
        postgresql.pam postgresql.logrotate
        postgresql.service postgresql.tmpfiles.conf postgresql-check-db-dir)
install=postgresql.install

# Slow git server is slow, use Github mirror instead
#_gitroot="git://git.postgresql.org/git/postgresql.git"
_gitroot="git://git.postgresql.org/git/2ndquadrant_bdr.git"
_gitname="postgresql"
_gitbranch="bdr-pg/REL9_4_STABLE"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone -b "$_gitbranch" "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -b "$_gitbranch" "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -Np1 < ../postgresql-run-socket.patch
  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-libxml \
  --with-openssl \
  --with-perl \
  --with-python PYTHON=/usr/bin/python2 \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --enable-nls \
  --enable-thread-safety
  #--with-krb5 \
  #--with-tcl \

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  # install
  make -C contrib DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"
  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"
  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
md5sums=('75c579eed03ffb2312631f0b649175b4'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137'
         '89b48774b0dae7c37fbb0e907c3c1db8'
         '1c5a1f99e8e93776c593c468e2612985'
         'ba9b7d804500dffc095eac78c4a2a00f')
