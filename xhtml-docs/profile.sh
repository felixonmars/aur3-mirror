# /etc/profile.d/xhtml-dtd.sh

if [ -f "/usr/share/doc/xhtml/DTD/xhtml.soc" ]; then
  case "${SGML_CATALOG_FILES}" in
    /usr/share/doc/xhtml/DTD/xhtml.soc)
      ;;
    /usr/share/doc/xhtml/DTD/xhtml.soc:*)
      ;;
    *:/usr/share/doc/xhtml/DTD/xhtml.soc)
      ;;
    *:/usr/share/doc/xhtml/DTD/xhtml.soc:*)
      ;;
    *)
      SGML_CATALOG_FILES="${SGML_CATALOG_FILES:-}${SGML_CATALOG_FILES:+:}/usr/share/doc/xhtml/DTD/xhtml.soc"
      export SGML_CATALOG_FILES
      ;;
  esac
fi

# /etc/profile.d/xhtml-dtd.sh ends here.
