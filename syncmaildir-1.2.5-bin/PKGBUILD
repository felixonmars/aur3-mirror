#!/bin/bash
# ^ Above shabeng-line to automatically switch on syntax highlighting in some editors.

# Maintainer: dreieck
# Contributor: Thomas Jost <schnouki [at] schnouki ]dot[ net>
_pkgname=syncmaildir
_pkgver=1.2.5
pkgname="${_pkgname}-${_pkgver}-bin"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Synchronize a pair of mailboxes in Maildir format via ssh. Version ${_pkgver}, precompiled binary from debian wheezy."
arch=("i686" "x86_64")
url="http://syncmaildir.sourceforge.net/"
license=('GPL3')
depends=('lua51' 'xdelta')
optdepends=()
makedepends=('dpkg') # Extract debian packages.
provides=(
          "${_pkgname}=${pkgver}"
          "syncmaildir-applet=${pkgver}"
         )
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgver}")

options=("!emptydirs")

install="syncmaildir.install"

case "${CARCH}" in
  "i686")
    _srcfilenames=(
                'syncmaildir_1.2.5-1_i386.deb'
                'syncmaildir-applet_1.2.5-1_i386.deb'
               )
    _sha512sums=(
                 'f40d54779eae745f5b8f0b5a8cd9db0ffd469980c26cc70d6e82fbfc7dce06efc417e6abf31f9c7c86f56f422f57b0a2238c27b4740fc25b4478847f6e643923'
                 'e91c7ae8b08aba948eaff8ecec65b9052042ca9601714d393ce307d6c5fdde43ffd61e1cd1645ec292cf1e89a421ef17addb3c9e32c6dbb34e55e49007b8508b'
                )
  ;;
  "x86_64")
    _srcfilenames=(
                'syncmaildir_1.2.5-1_amd64.deb'
                'syncmaildir-applet_1.2.5-1_amd64.deb'
               )
    _sha512sums=(
                 '3e7fb56f7e294ea2c6b4b15b6aff3b1f30c69077e40cf0d9b6ba2d62a9dd4db57a7ad0e8a9b90cdb45d0a5f7294d7fafc9bbb21aaa69d9b042b17391a0d6cb6d'
                 'a31b89700a78a1b4c9925d1792898e0b2138e8dcd25eeff5ae952ae0d210d22216a54ca3ea03d4d552c7e7b2a5112a2c52098fbc7ec5f9bed7482ea9e292aa2c'
                )
  ;;
  *)
    echo "Error: Build for Architecture '${CARCH}' not defined. Aborting."
    false
    exit 1
  ;;
esac

source=(
        "http://ftp.de.debian.org/debian/pool/main/s/syncmaildir/${_srcfilenames[0]}"
        "http://ftp.de.debian.org/debian/pool/main/s/syncmaildir/${_srcfilenames[1]}"
        "${install}"
       )
sha512sums=(
            "${_sha512sums[@]}"
            '8b67c208dc4bf4a6695bcc290dbdca4fbeb429b4820bdbded3f8924ebaa9c3170df02294204d2718ad5c188731a23703a4a93efff20cc175884855f8f3ea5374'
           )

package() {
  cd "${srcdir}"
  for _srcfilename in "${_srcfilenames[@]}"; do
    dpkg --extract "${_srcfilename}" "${pkgdir}"
  done
}

