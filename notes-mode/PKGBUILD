# Contributor: Alexander Rampp <alex@axgr.de>
pkgname=notes-mode
pkgver=1.27
pkgrel=1
pkgdesc="Notes-mode is an indexing system for on-line note-taking in Emacs"
arch=('i686')
url="http://www.isi.edu/~johnh/SOFTWARE/NOTES_MODE/"
license=('GPL2')
depends=('emacs>=19' 'perl>=5')
source=(http://www.isi.edu/~johnh/SOFTWARE/NOTES_MODE/$pkgname-$pkgver.tar.gz)
install='notes-mode.install'
md5sums=('35e033e7d33721e8fe2f89f226147321')


build() {
  
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix="$pkgdir/usr"  \
  	        --with-lisp-dir="${pkgdir}/usr/share/emacs/site-lisp" \
	        || return 1
  
  make DESTDIR="$pkgdir" install || return 1

  install -m755 -D  "$pkgdir/usr/share/notes-mode/notesinit" "$pkgdir/usr/bin/notesinit"

  rm "$pkgdir/usr/share/info/dir"
  # If umask is set too tight, make install gives wrong permissions for
  # some files.  That is because cp is used in the makefile.
  install -m644 README release "$pkgdir/usr/share/notes-mode"
  install -m755 sample.notesrc "$pkgdir/usr/share/notes-mode"
  install -m644 notes-mode.info "$pkgdir/usr/share/info/notes-mode"
  gzip -9nf "$pkgdir/usr/share/info/notes-mode"
}
