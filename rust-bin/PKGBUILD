# Maintainer: Kevin Knapp
pkgname=rust-bin
pkgver=1.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Fast, concurrent, safe. The Rust programming language and its package manager, Cargo.'
url='http://www.rust-lang.org/'
provides=('rust' 'cargo')
conflicts=('rust' 'rust-nightly-bin' 'rust-git' 'rust-nightly' 'cargo-nightly-bin' 'cargo-bin' 'rust-beta-bin')
depends=('shared-mime-info')
license=('MIT' 'Apache')
 
source=('https://raw.githubusercontent.com/rust-lang/gedit-config/master/share/mime/packages/rust.xml'
        'rust.conf')
sha256sums=('a2a6609d6a89dd57f1bf874da222316c2b3c8ffcfe5b5ae87f8489096744446d'
            'fc2ed32e9841d2080803b117a773aa6606fc74391fec76fbadd2e952ca1fc256')
sha256sums_i686=('aab0d853314675d5e80e427c613a0e646ae75fbbc856b886dab682280f825d53')
sha256sums_x86_64=('aab0d853314675d5e80e427c613a0e646ae75fbbc856b886dab682280f825d53')
 
source_x86_64=("https://static.rust-lang.org/dist/rust-${pkgver//_/-}-${CARCH}-unknown-linux-gnu.tar.gz")
 
source_i686=("https://static.rust-lang.org/dist/rust-${pkgver//_/-}-${CARCH}-unknown-linux-gnu.tar.gz")
 
install=rust.install
options=(staticlibs !strip)
 
package() {
    local INSTALL_DIR=/usr/local
    local MAN_DIR=/usr/local/man
 
    # Rust, Cargo and Documentation.
    cd rust-${pkgver//_/-}-${CARCH}-unknown-linux-gnu
    ./install.sh --prefix=${pkgdir}${INSTALL_DIR} --mandir=${pkgdir}${MAN_DIR}
 
    # Establish .rs MIME type association.
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    install -m 644 "${srcdir}/rust.xml" "${pkgdir}/usr/share/mime/packages/rust.xml"
 
    # Dynamic linker configuration (no LD_LIBRARY_PATH required).
    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    install -m 644 "${srcdir}/rust-beta.conf" "${pkgdir}/etc/ld.so.conf.d/rust-beta.conf"
 
    # Remove manifest file referencing $pkgdir.
    rm -f "${pkgdir}/usr/local/lib/rustlib/manifest-rustc"
}
