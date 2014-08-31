# Maintainer: Stefan Berggren <nsg@nsg.cc>

pkgname=lib64-krb5
pkgver=1.12.2
pkgrel=1
pkgdesc="The MIT Kerberos network authentication system libraries"
arch=('x86_64')
url="http://web.mit.edu/kerberos/"
license=('custom')
depends=('e2fsprogs' 'libldap' 'keyutils') # TODO: check this
makedepends=('perl' 'python2')
provides=('krb5')
conflicts=('krb5')
source=("http://web.mit.edu/kerberos/dist/krb5/${pkgver%.*}/krb5-${pkgver}-signed.tar")
md5sums=('357f1312b7720a0a591e22db0f7829fe')

prepare() {
  _check_pgpsig
  tar xf krb5-${pkgver}.tar.gz
}

build() {
  cd krb5-${pkgver}/src
  export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
  export CPPFLAGS+=" -I/usr/include/et"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --localstatedir=/var/lib \
              --enable-shared \
              --with-system-et \
              --with-system-ss \
              --disable-rpath \
              --without-tcl \
              --enable-dns-for-realm \
              --with-ldap \
              --without-system-verto
  local num_cpu=$(grep -c processor /proc/cpuinfo)
  if [ -z $num_cpu ]; then
    make
  else
    make -j $num_cpu
  fi
}

check() {
  mkdir -p fake_python2
  echo -e "#!/bin/bash\n\nexec python2 \"\$@\"" > fake_python2/python
  chmod +x fake_python2/python
  export PATH=$PWD/fake_python2:$PATH
  cd krb5-${pkgver}/src
  msg "Using $(python --version 2>&1) from $(type python | awk '{print $NF}')"
  make check
}

package() {
  cd krb5-${pkgver}/src
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/krb5-${pkgver}/NOTICE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -dm 755 "${pkgdir}"/usr/share/aclocal
  install -m 644 util/ac_check_krb5.m4 "${pkgdir}"/usr/share/aclocal
  if [ -z $pkgdir ]; then
    error "pkgdir is empty, abort!"
    exit 1
  fi
  rm -rf "${pkgdir}"/var
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}


# from package krb5, changed the check a little
_check_pgpsig() {
  (( SKIPPGPCHECK )) && return 0

  msg "$(gettext "Verifying source file signatures with %s...")" "gpg"

  local file=krb5-${pkgver}.tar.gz.asc
  local sourcefile=${file%.*}
  local pubkey
  local warning=0
  local errors=0
  local statusfile=$(mktemp)
  local signed_signature=15024CD3749D7889

  printf "    %s ... " "${file%.*}" >&2

  if ! gpg --quiet --batch --status-file "$statusfile" --verify "$file" "$sourcefile" 2> /dev/null; then
    printf "FAILED" >&2
    if ! pubkey=$(awk '/NO_PUBKEY/ { print $3; exit 1; }' "$statusfile"); then
      printf " (unknown public key $pubkey)" >&2
      warnings=1
    else
      errors=1
    fi
    printf '\n' >&2
  else
    if grep -q "REVKEYSIG" "$statusfile"; then
      printf "FAILED (the key has been revoked.)" >&2
      errors=1
    else
      printf "Passed" >&2
      if grep -q "EXPSIG" "$statusfile"; then
        printf " (WARNING: the signature has expired.)" >&2
        warnings=1
      elif grep -q "EXPKEYSIG" "$statusfile"; then
        printf " (WARNING: the key has expired.)" >&2
        warnings=1
      fi
    fi
    printf '\n' >&2
  fi
  
  rm -f "$statusfile"

  if (( errors )); then
    error "One or more PGP signatures could not be verified!"
    exit 1
  fi

  if (( warnings )); then
    warning "Warnings have occurred while verifying the signatures."
    plain "Please make sure you really trust them."
    if [ "x$pubkey" == "x$signed_signature" ]; then
      plain "The signature $pubkey matched the one stored inside this package."
      plain "https://pgp.mit.edu/pks/lookup?search=0x749D7889&op=index"
      plain "pub  2048R/749D7889 2001-10-01 Tom Yu <tlyu@mit.edu>"
    else
      plain "Aborted, set SKIPPGPCHECK to true to ignore the GPG check"
      exit 1
    fi
  fi
}
